import { MailerService } from '@nestjs-modules/mailer';
import { CallHandler, Controller, ExecutionContext, Injectable, NestInterceptor, UseInterceptors } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Crud, CrudAuth, CrudController, CrudRequest, CrudRequestInterceptor, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { User } from 'src/users/user.entity';
import { Userv2Service } from './userv2.service';
import * as bcript from 'bcrypt';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { KeyClockService } from 'src/auth/keycloak-nodejs-admin-client/keyclock.service';
import { Observable } from 'rxjs';
import { InstitutionFilterInterceptor } from './institution-filter.interceptor';
import { UserType } from 'src/users/user.type.entity';
import { Request, Post, UseGuards } from '@nestjs/common';
import { IncomingMessage } from 'http';



const { v4: uuidv4 } = require('uuid');

@Crud({
  model: {
    type: User,
  },
  query: {
    join: {
      institution: {
        eager: true,

      },
      userType: {
        eager: true,
      },


    },

    // this works
    // filter: {
    //   id: {
    //     $eq: 1,
    //   }
    // }

  }


})

@CrudAuth({
  property: 'user',
  // this works
  // filter: (user: User) => {
  //   console.log(user);
  //   if(user.email == 'superadmin@ccsdsnlk.lk'){
  //     return ({
  //       'institution.id' : 14
  //     })}

  //   else {
  //   return ({
  //   'institution.id' : 1
  // })}
  //}
})

@Controller("userv2")
export class Userv2Controller implements CrudController<User> {
  constructor(
    @InjectRepository(User)
    private readonly usersRepository: Repository<User>,
    public service: Userv2Service,
    private readonly mailerService: MailerService,
    private configService: ConfigService,
    private keyClockService: KeyClockService
  ) { }

  get base(): CrudController<User> {
    return this;
  }

  @Override()
  async deleteOne(@ParsedRequest() req: CrudRequest) {
    const id = req.parsed.paramsFilter
      .find(f => f.field === 'id' && f.operator === '$eq').value;

    let username = await this.service.findOne(id + "");
    console.log("delete user id", id);
    const res = await this.service.softDelete(id);
    if (username) {
      // remove user from keyclock
      //await this.keyClockService.createUser(newUserDb);
      await this.keyClockService.deleteUser(username.email);
    }
    return res;
  }


  @Override()
  async getOne(@ParsedRequest() req: CrudRequest, @Request() req2) {

    let userEmail = req2.user.email;

    let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });

    if (currentDBUser.userType.id != 1) {
      // not ccs admin , linit data for the users' institution 

      if (currentDBUser.userType.id == 4) {
        /// doe
        req.parsed.search['$and'].push({ 'id': (currentDBUser).id });

      }
      else {
        req.parsed.search['$and'].push({ 'institution.id': (currentDBUser).institution.id });

      }

    }

    // console.log(req.parsed.filter.length, req.parsed.search['$and'][0]);

    let userList = this.base.getOneBase(req);

    return userList;


  }

  @Override()
  async getMany(@ParsedRequest() req: CrudRequest, @Request() req2) {

    let userEmail = req2.user.email;

    let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });

    // console.log("currentDBUsercurrentDBUsercurrentDBUsercurrentDBUsercurrentDBUser", currentDBUser);
    // console.log(currentDBUser);


    if (currentDBUser.userType.id != 1) {
      // not ccs admin , linit data for the users' institution 
      if (currentDBUser.userType.id == 4) {
        /// doe
        req.parsed.search['$and'].push({ 'id': (currentDBUser).id });

      }
      else {
        req.parsed.search['$and'].push({ 'institution.id': (currentDBUser).institution.id });

      }
    }

    console.log(req.parsed.filter.length, req.parsed.search['$and'][0]);

    let userList = this.base.getManyBase(req);

    return userList;


  }


  @Override()
  async createOne(
    @ParsedRequest() req: CrudRequest,
    @ParsedBody() dto: User,
  ) {

    let currentDBUser = await this.usersRepository.findOne({ where: { email: dto.email }, withDeleted : true });
    console.log("create user : currentDBUser", currentDBUser);
    let newUserDb: User;
    if (currentDBUser?.userType?.id && currentDBUser?.deletedAt) {
      // not ccs admin , linit data for the users' institution 
      newUserDb = currentDBUser;
      this.usersRepository.restore(currentDBUser?.userType?.id); // remove the soft delete (deletedAt)
    }
    else { // create new user

      try{
        newUserDb = await this.base.createOneBase(req, dto);

      } catch (error){
        // this.usersRepository.restore(currentDBUser?.userType?.id); // remove the soft delete (deletedAt)
        // console.log("user credtion error ", error);
        // if(error?.QueryFailedError?.ER_DUP_ENTRY){
        //   // dolicate entry
        //   console.log("user credtion error dolicate user",error?.QueryFailedError?.ER_DUP_ENTRY);
        // }
      }

    }


    let newUUID = uuidv4();
    let newPassword = ("" + newUUID).substr(0, 6);
    newUserDb.password = newPassword;
    newUserDb.salt = await bcript.genSalt();
    newUserDb.password = await this.hashPassword(newPassword, newUserDb.salt);
    newUserDb.resetToken = "";

    await this.usersRepository.update(newUserDb.id, newUserDb);

    if (newUserDb?.id > 0) {
      //ne wuser is created in db, create a new user in keyclock server

      let isUserCreated = await this.keyClockService.createUser(newUserDb);

      if (!isUserCreated) {
        // delet the local db user on keyclok server user creation failed
        await this.usersRepository.delete(newUserDb.id + "");

        throw new Error("Error on keyclok user creation. Please try gain.");

      }

    }
    // get an environment variable
   // let systemLoginUrl = this.configService.get<string>('https://nccdsn.env.gov.lk/login/');
    let systemLoginUrl = 'https://nccdsn.env.gov.lk/login/'

    // sned email with new password
    this
      .mailerService
      .sendMail({
        to: newUserDb.email, // list of receivers
        from: 'no-reply-ncc-dsn@climatesi.com', // sender address
        subject: 'NCC DSN system login url', // Subject line
        //text: 'your username is ' +newUserDb.email+ ' and your new login password is : ' + newPassword // plaintext body
        html: 'Dear ' + newUserDb.title + ' ' + newUserDb.lastName + ' <br/>Your username is ' + newUserDb.email + ' <br/><br/>System login url is' + '<a href="' + systemLoginUrl + '"> Click here to login</a>' + '<br/><br/>#nccdsnteam',
      })
      .then((res) => {
        console.log("email sent =========", res);

      })
      .catch((e) => {

        console.log("email error =========", e);
      });

    return newUserDb;
  }

  private async hashPassword(password: string, salt: string): Promise<string> {
    return await bcript.hash(password, salt);
  }



}

