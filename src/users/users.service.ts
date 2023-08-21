import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { count } from 'console';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './user.entity';
import * as bcript from 'bcrypt';
import { ResetPassword } from 'src/auth/Dto/reset.password.dto';
import { RSA_PSS_SALTLEN_MAX_SIGN } from 'constants';
import { RecordStatus } from 'src/shared/base.tracking.entity';
import { UserType } from './user.type.entity';
import { MailerService } from '@nestjs-modules/mailer';
import { ConfigService } from '@nestjs/config';
import { Institution } from 'src/institution/institution.entity';
import { KeyClockService } from 'src/auth/keycloak-nodejs-admin-client/keyclock.service';

const { v4: uuidv4 } = require('uuid');



@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly usersRepository: Repository<User>,
    @InjectRepository(Institution)
    private readonly institutionRepository: Repository<Institution>,
    @InjectRepository(UserType)
    private readonly usersTypeRepository: Repository<UserType>,
    private readonly mailerService: MailerService,
    private configService: ConfigService,
    private keyClockService: KeyClockService

  ) { }

  async create(createUserDto: CreateUserDto): Promise<User> {

    let userType = await this.usersTypeRepository.findOne(createUserDto.userTypeId);
    let institution = await this.institutionRepository.findOne(createUserDto.institutionId);

    let newUser = new User();

    newUser.firstName = createUserDto.firstName;
    newUser.lastName = createUserDto.lastName;
    newUser.username = createUserDto.username;
    newUser.email = createUserDto.email;
    newUser.designation = createUserDto.designation;
    newUser.mobile = createUserDto.mobile;
    newUser.nic = createUserDto.nic;
    newUser.status = RecordStatus.Active;
    newUser.telephone = createUserDto.telephone;
    newUser.title = createUserDto.title;
    newUser.userType = userType;
    newUser.institution = institution;

    newUser.salt = await bcript.genSalt();

    let newUUID = uuidv4();
    let newPassword = ("" + newUUID).substr(0, 6);
    createUserDto.password = newPassword;
    newUser.password = await this.hashPassword(createUserDto.password, newUser.salt);
    newUser.resetToken = "";

    var newUserDb = await this.usersRepository.save(newUser);

    if(newUserDb?.id > 0){
      //ne wuser is created in db, create a new user in keyclock server
      try {
        console.log(" calling this.keyClockService.createUser ")
        await this.keyClockService.createUser(newUserDb);

      } catch (e){
        // user creation error, remove the new user from db, so it can be recreated with sme email later
        console.log(" Error on  this.keyClockService.createUser ", e);
        var deleteResult = await this.usersRepository.delete(newUserDb?.id + "");
        console.log("deleteResult", deleteResult);
      } finally {

        console.log("key clock user creation over");


      }

    }


    // get an environment variable
    let systemLoginUrl = this.configService.get<string>('LOGIN_URL');
    // sned email with new password
    this
      .mailerService
      .sendMail({
        to: newUserDb.email, // list of receivers
        from: 'no-reply-ncc-dsn@climatesi.com', // sender address
        subject: 'Your credentials for NCC DSN system', // Subject line
        //text: 'your username is ' +newUserDb.email+ ' and your new login password is : ' + newPassword // plaintext body
        html: 'Dear ' + newUserDb.title + ' ' + newUserDb.lastName + ' <br/>Your username is ' + 
        newUserDb.email + ' and your new login password is : ' +
         newPassword + ' <br/>System login url is' + systemLoginUrl,
      })
      .then((res) => {
        console.log("email sent =========", res);

      })
      .catch((e) => {

        console.log("email error =========", e);
      });

    newUserDb.password = "";
    newUserDb.salt = "";

    return newUserDb;
  }

  async chnagePassword(userId: number, newPassword: string): Promise<User> {

    let user = await this.usersRepository.findOne(userId);
    user.password = newPassword;
    return this.usersRepository.save(user);

  }

  async updateChnagePasswordToken(userId: number, newToken: string): Promise<User> {

    let user = await this.usersRepository.findOne(userId);
    user.resetToken = newToken;
    return this.usersRepository.save(user);

  }


  async findAll(): Promise<User[]> {
    return this.usersRepository.find();
  }

  findByUserName(userName: string): Promise<User> {
    return this.usersRepository.findOne({ username: userName });
  }

  async validateUser(userName: string, password: string): Promise<boolean> {
    const user = await this.usersRepository.findOne({ username: userName });

    console.log(user);

    return (await user).validatePassword(password);
  }

  findOne(id: string): Promise<User> {
    return this.usersRepository.findOne(id);
  }

  async isUserAvailable(userName: string): Promise<any> {
    // await this.usersRepository.count({username: userName}).then((value)=>{
    //   if(value>0){
    //     return true;
    //   }
    //   else{
    //     return false;
    //   }
    // }).catch(()=>{
    //   return false;
    // });
    let user = await this.usersRepository.findOne({ username: userName })
    if (user) {
      console.log("UsersService.findByUserName : true ===============");

      return user;
    }
    else {
      console.log("UsersService.findByUserName : false ===============");

      return user;
    }
  }

  async findUserByUserName(userName: string): Promise<any> {
    return await this.usersRepository.findOne({ username: userName }).then((value) => {
      console.log(value);
      if (!!value) {
        console.log("inside", value.id);

        return value.id;
      }
      else {
        return 0;
      }
    }).catch(() => {
      return 0;
    });
  }

  async findUserByEmail(email: string): Promise<any> {
    return await this.usersRepository.findOne({ email: email }).then((value) => {
      console.log(value);
      if (!!value) {
        console.log("inside", value.id);

        return value;
      }
      else {
        return false;
      }
    }).catch((e) => {
      console.log("findUserByEmail error", e);
      return false;
    });
  }

  async remove(id: number): Promise<void> {
    await this.usersRepository.delete(id + "");
  }

  async validateResetPasswordRequest(email: string, token: string): Promise<boolean> {
    const user = await this.usersRepository.findOne({ email: email });
    console.log(user);

    if (user && (user.resetToken === token)) {
      console.log('in if ');

      return true
    }
    else {
      console.log('in else');

      return false;
    }
  }

  async resetPassword(email: string, password: string): Promise<boolean> {

    let user = await this.usersRepository.findOne({ email: email });
    console.log(user);
    if (user) {
      let salt = await bcript.genSalt();
      console.log("password", password, "salt", salt);
      user.salt = salt;
      user.password = await this.hashPassword(password, salt);
      console.log('inside success');

      await this.usersRepository.save(user)

      console.log('inside success2');

      await this.updateChnagePasswordToken(user.id, ""); // clean the tocken

      console.log('inside success3');

      return true;

    }
    console.log('inside fail');

    return false;
  }

  private async hashPassword(password: string, salt: string): Promise<string> {
    return await bcript.hash(password, salt);
  }
}
