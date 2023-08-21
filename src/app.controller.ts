import { Body, Controller, Get, Param, Put, Res } from '@nestjs/common';
import { AppService } from './app.service';
import { Request, Post, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { LocalAuthGuard } from './auth/guards/local-auth.guard';
import { AuthService } from './auth/auth.service';
import { JwtAuthGuard } from './auth/guards/jwt-auth.guard';
import { AuthCredentialDto } from './auth/Dto/auth.credential.dto';
import { UsersService } from './users/users.service';
import { MailerService } from '@nestjs-modules/mailer';
import { ForgotPasswordDto } from './auth/Dto/forgot.passowrd.dto';
import { ResetPassword } from './auth/Dto/reset.password.dto';
import { ConfigService } from '@nestjs/config';
import { authenticate } from 'passport';
import { MiddlewareBuilder } from '@nestjs/core';
import { JwtStrategy } from './auth/strategies/jwt.strategy';
import { AllowAnyRole, Roles, Unprotected } from 'nest-keycloak-connect';
import Keycloak from 'keycloak-js';
import { KeyClockService } from './auth/keycloak-nodejs-admin-client/keyclock.service';
import { User } from './users/user.entity';
import { SchedulerRegistry } from '@nestjs/schedule'

const { v4: uuidv4 } = require('uuid');
const fs = require('fs')


var jwt = require('jsonwebtoken');


@Controller()
export class AppController {
  constructor(private readonly appService: AppService,
    private authService: AuthService,
    private usersService: UsersService,
    private readonly mailerService: MailerService,
    private configService: ConfigService,
    private keyClockService: KeyClockService,
    private schedulerRegistry: SchedulerRegistry

  ) { }

  @Get()
  @Unprotected()
  async getHello(): Promise<string> {

    const job = this.schedulerRegistry.getCronJob('notifications');

    job.start();

    await this.keyClockService.getUsers();

    return await this.appService.getHello();
  }

  @Post('auth/login')
  async login(@Body() authCredentialDto: AuthCredentialDto): Promise<any> {
    //return req.user;
    console.log("AppController.login");

    return await this.authService.login(authCredentialDto);
  }

  @Get('auth/validate-reset-password/:email/:token')
  async validateResetPassword(@Param('email') email: string, @Param('token') token: string): Promise<boolean> {

    console.log("inside");

    return await this.usersService.validateResetPasswordRequest(email, token);
  }

  @Put('auth/reset-password')
  async resetPassword(@Body() resetPwd: ResetPassword): Promise<boolean> {
    console.log("resetPwd", resetPwd);

    if (await this.usersService.validateResetPasswordRequest(resetPwd.email, resetPwd.token)) {
      console.log('is valid');

      let res = await this.usersService.resetPassword(resetPwd.email, resetPwd.password);

      return res;

    }
    return false;
  }


  @Post('auth/forgot-password')
  async forgotPassword(@Body() forgotparam: ForgotPasswordDto, @Res() response: any): Promise<any> {
    //return req.user;
    console.log("forgotPassword=========", forgotparam);
    let user = await this.usersService.findUserByEmail(forgotparam.email);
    console.log("resultData=========", user);

    if (!user) {
      const errorResponse: any = {
        status: 0,
        message: 'Invalid Email/User Id',
      };
      return response.status(400).send(errorResponse);
    }

    let pwdRestToken = uuidv4();

    user = await this.usersService.updateChnagePasswordToken(user.id, pwdRestToken);;

    console.log("updateChnagePasswordToken user=========", user);

    let emailTemplate = "";

    emailTemplate = fs.readFileSync('./src/template/email/reset-password.html', 'utf8');

    // get an environment variable
    const resetPwdUrl = this.configService.get<string>('PWD_RESET_URL');

    console.log("PWD_RESET_URL", resetPwdUrl);

    emailTemplate = emailTemplate.replace("[RESER_PWD_URL]", resetPwdUrl + "?token=" + pwdRestToken + "&email=" + forgotparam.email);

    // sned email with new password
    this
      .mailerService
      .sendMail({
        to: user.email, // list of receivers
        from: 'no-reply-ncc-dsn@climatesi.com', // sender address
        subject: 'Reset your ncc-dsn login password', // Subject line
        //text: 'Your new wealth manager login password is : ' + tempPassword, // plaintext body
        html: emailTemplate, // HTML body content
      })
      .then((res) => {
        console.log("email sent =========", res);

      })
      .catch((e) => {

        console.log("email error =========", e);
      });

    return response.status(200).send(true)

  }




  @Get('profile')
  //@Unprotected()
  //@Roles("ccs-admin","")
  //@AllowAnyRole()
  //@Roles('admin')
  getProfile(@Request() req) {
    // this.keycloakService.grantManager.userInfo(""+req.accessTokenJWT).then(x=>{
    //   console.log("xxxxxxxxxxxxxx",x);
    // })

    let jwtObj = jwt.decode(req.accessTokenJWT);



    console.log("resuest=============", req);
    return { userx: req.user, jwtObj: jwtObj, test: "test" };
  }

  //testing mail
  @Unprotected()
  @Post('test')
  mailtest(@Request() req) {

    this
    .mailerService
    .sendMail({
      to: 'pmjayasinghe1025@gmail.com', // list of receivers
      from: 'no-reply-ncc-dsn@climatesi.com', // sender address
      subject: 'test mail', // Subject line
      //text: 'Your new wealth manager login password is : ' + tempPassword, // plaintext body
      html: "test",// HTML body content
    })
    .then((res) => {
      console.log("email sent =========", res);

    })
    .catch((e) => {

      console.log("email error =========", e);
    });

    return "testmail";
  }


  @Get('/admin')
  @Roles('admin')
  getAdmin(@Request() req): string {

    let jwtObj = jwt.decode(req.accessTokenJWT);
    console.log("resuest=============", req);

    return `Hi from admin`;

  }

  @Get('/user-info')
  // @Roles('admin')
  getUserInfo(@Request() req): Promise<User> {

    let userEmail = req.user.email;
    let user = this.usersService.findUserByEmail(userEmail);
    return user;

  }



}

