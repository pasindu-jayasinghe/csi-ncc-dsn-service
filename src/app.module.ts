import { ParameterDataType } from './parameter/entity/parameter-data-type.entity';
import { Deadline } from './masterdata/entity/deadline.entity';
import { ClimateImpact } from './masterdata/entity/climate-Impact.entity';
import { Hierarchy } from './masterdata/entity/Hierarchy.entity';
import { DataRequestStatusHistory } from './masterdata/entity/datarequst-status-history.entity';
import { DataRequestStatus } from './masterdata/entity/datarequst-status.entity';
import { join } from 'path';
import { Documents } from './document/entity/document.entity';
import { SDBenefit } from './masterdata/entity/sd-benefit.entity';
import { ProjectStatusModule } from './project-program/project-status/project-status.module';
import { ProjectStatus } from './project-program/entity/project-status.entity';
import { Module, HttpModule, NestModule, MiddlewareConsumer } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { AuthModule } from './auth/auth.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './users/user.entity';
import { MailerModule } from '@nestjs-modules/mailer';
import { IWOSAPIConfig } from './services/IWOSAPIConfig';
import { ConfigModule } from '@nestjs/config';
import { UserType } from './users/user.type.entity';
import { InstitutionModule } from './institution/institution.module';
import { Userv2Service } from './userv2/userv2.service';
import { Userv2Module } from './userv2/userv2.module';
import { MasterdataModule } from './masterdata/masterdata.module';
import { UserTypeService } from './masterdata/user-type/user.type.service';
import { InstitutionCategory } from './institution/institution.category.entity';
import { Province } from './masterdata/entity/provice.entity';
import { District } from './masterdata/entity/district.entity';
import { DivisionalSecretariat } from './masterdata/entity/divisional.secretariat.entity';
import { Institution } from './institution/institution.entity';
import { InstitutionType } from './institution/institution.type.entity';
import { ParameterModule } from './parameter/parameter.module';
import { ProjectProgramModule } from './project-program/project-program.module';
import { PolicyModule } from './policy/policy.module';
import { ClimateChangeDataCategory } from './parameter/entity/climate.change.data.category.entity';
import { ParameterLocationData } from './parameter/entity/parameter-location-data.entity';
import { ParameterLocation } from './parameter/entity/parameter-location.entity';
import { Parameter } from './parameter/entity/parameter.entity';
import { Sector } from './parameter/entity/sector.entity';
import { SectorMOE } from './parameter/entity/sector.moe.entity';
import { SubSector } from './parameter/entity/sub.sector.entity';
import { Policy } from './policy/entity/policy.entity';
import { ProjectProgramme } from './project-program/entity/project-programme.entity';
import { ProjectType } from './project-program/entity/project-type.entity';
import { UnitOfMeasure } from './parameter/entity/unitofmeasure.entity';
import { FinancingScheme } from './masterdata/entity/financing-scheme.entity';
import { Currency } from './masterdata/entity/currency.entity';
import { DocumentModule } from './document/document.module';
import { DocumentOwner } from './document/entity/document-owner.entity';
import { ServeStaticModule } from '@nestjs/serve-static';
import { MulterModule } from '@nestjs/platform-express';
import { statticFileLocation } from './document/entity/file-upload.utils';
import { Frequency } from './masterdata/entity/frequency.entity';
import { FrequencyDetail } from './masterdata/entity/frequency-details.entity';
import { DatarequestStatusHistoryModule } from './datarequest-status-history/datarequest-status-history.module';
import { ProjectProgramData } from './project-program/entity/project-program-data.entity';
import { ProjectProgramDataModule } from './project-program/project-program-data/project-program-data.module';
import { Mitigation } from './masterdata/mitigation/entity/mitigation.entity';
import { ProjectFundingDetail } from './project-program/entity/project-funding-detail.entity';

import { FinanceModule } from './finance/finance.module';
import { ShoppingCartItem } from './finance/entity/shopping-cart-item.entity';
import { ShoppingCart } from './finance/entity/shopping-cart.entity';
import { PolicyData } from './policy/entity/policy-data.entity';
import { PolicyDataModule } from './policy/policy-data/policy-data.module';
import { ChartService } from './chart/chart.service';
import { ChartController } from './chart/chart.controller';
import { ChartModule } from './chart/chart.module';
import { PublicController } from './public/public/public.controller';
import { PublicService } from './public/public/public.service';
import { PublicModule } from './public/public/public.module';

import {
  KeycloakConnectModule,
  ResourceGuard,
  RoleGuard,
  AuthGuard,
} from 'nest-keycloak-connect';
import { APP_GUARD } from '@nestjs/core';
import { KeyClockService } from './auth/keycloak-nodejs-admin-client/keyclock.service';
import { ScheduleModule } from '@nestjs/schedule';
import { EmailRemindersJobService } from './jobs/test.job.service';
import { UomConversion } from './masterdata/uom-conversion/entity/uom-conversion.entity';

import { UserDataUsageCategory } from './users/user-data-usage-category.entity';
import { DataUsageCategory } from './users/data-usage-category.entity';
import { UserDataUsageCategoryModule } from './users/user-data-usage-category/user-data-usage-category.module';

import { ShoppingCartPaymentService } from './finance/service/shopping-cart.payment.service';
import { ShoppingCartPayment } from './finance/entity/shopping-cart.payment.entity';
import { AppLoggerMiddleware } from './auth/apploggermiddleware';


@Module({
  imports: [
    ScheduleModule.forRoot(),
    KeycloakConnectModule.register({
      //http://ec2-3-7-54-14.ap-south-1.compute.amazonaws.com:8080
      //authServerUrl: "http://13.76.166.4:8080/auth/",//process.env.authServerUrl,
      authServerUrl: "https://nccdsn.env.gov.lk/auth/",//process.env.authServerUrl,
      realm: "ncc-dsn",//process.env.realm,
      clientId: "dsn-app-service",//process.env.clientId,
      //secret: "1869b32e-03e1-460f-b02f-18f24db7bf5a",//process.env.secret, local
      //secret: "d72f078c-64c5-4e64-aa0f-20d2773deb2b",//process.env.secret, 13.76.166.4
      secret: "49ebecd7-1aab-42e0-8d18-05fb7adfe924",//process.env.secret, ec2-3-7-54-14.ap-south-1.compute.amazonaws.com
      // optional if you want to retrieve JWT from cookie
      //cookieKey: 'KEYCLOAK_JWT',
    }),
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', '../static-files'),
      renderPath: "nccdsnsspa",
      exclude: ['/api*'],
      serveStaticOptions: { index: false },
    }),
    ConfigModule.forRoot({
      isGlobal: true,
    }), UsersModule, AuthModule, HttpModule,
    TypeOrmModule.forFeature([User, UserType, Institution, InstitutionCategory, InstitutionType, ClimateChangeDataCategory,
      ClimateChangeDataCategory,
      UnitOfMeasure,
      Sector,
      SubSector,
      SectorMOE,
      ProjectType,
      ProjectProgramme,
      Policy,
      Parameter,
      ParameterLocation,
      ParameterLocationData,
      Province,
      District,
      DivisionalSecretariat,
      ProjectStatus,
      FinancingScheme,
      Currency,
      SDBenefit,
      Documents,
      Frequency,
      FrequencyDetail, DataRequestStatus, DataRequestStatusHistory,
      ProjectProgramData, Mitigation, Hierarchy, ClimateImpact, Deadline, ProjectFundingDetail, ShoppingCart, ShoppingCartItem, PolicyData,

      UomConversion, ParameterDataType, UserDataUsageCategory, DataUsageCategory, ShoppingCartPayment]),


    TypeOrmModule.forRoot({
      type: 'mysql',
      //host: '192.168.110.77',
      port: 3306,
      // username: 'root',
      // password: 'password',
      //database: 'nccdsndb',
      host: 'localhost',

      username: 'root',
      password: 'pasindu',
      database: 'ncc-dsn-db',
      entities: [User, UserType, Institution, InstitutionCategory, InstitutionType,
        Province, District, DivisionalSecretariat, ClimateChangeDataCategory, UnitOfMeasure,
        Sector,
        SubSector,
        SectorMOE,
        ProjectType,
        ProjectProgramme,
        Policy,
        Parameter,
        ParameterLocation,
        ParameterLocationData,
        ProjectStatus,
        FinancingScheme,
        Currency,
        SDBenefit,
        Documents,
        Frequency,
        FrequencyDetail, DataRequestStatus, DataRequestStatusHistory,
        ProjectProgramData, Mitigation, Hierarchy, ClimateImpact, Deadline, ProjectFundingDetail, ShoppingCart, ShoppingCartItem, PolicyData

        , UomConversion, ParameterDataType, UserDataUsageCategory, DataUsageCategory, ShoppingCartPayment],

      synchronize: true,
    }),


   
    

    MailerModule.forRoot({
      // transport: 'smtp://clarissa.walsh@ethereal.email:5JcvMErUHVuw9ETfFm@ethereal.email',
      // defaults: {
      //   from: '"Admin" <no-reply-ncc-dsn@climatesi.com>',
      // },
      // transport: 'smtp://nccdsn@gmail.com:Pxyz!@qaz@smtp.gmail.com',
      // defaults: {
      //   from: '"Admin" <nccdsn@gmail.com>',
      // },

      transport: {

        //----office 365---------
        // host: 'smtp.office365.com', // Office 365 server
        // port: 587,     // secure SMTP
        // secure: false, // false for TLS - as a boolean not string - but the default is false so just remove this completely
        // auth: {
         // user: "no-reply-ncc-dsn@climatesi.com",
         //pass: "LGNslcert2028"
        // },
        // requireTLS: true,
        // tls: {
        //     ciphers: 'SSLv3'
        // }

     
        
      //---gmail service---------
       service: 'gmail',
       secure: false, 
       ignoreTLS: true,// false for TLS - as a boolean not string - but the default is false so just remove this completely
        auth: {
          user: "noreplynccdsnlk@gmail.com",
          pass: "RFVedc*456",

        },
        
        
      },
      defaults: {
        from: '"no-reply-ncc-dsn@climatesi.com" <no-reply-ncc-dsn@climatesi.com>',
      },

      // template: {
      //   dir: __dirname + '/templates',
      //   options: {
      //     strict: true,
      //   },
      // },
    }),

    MulterModule.register({
      dest: '/upload',
    }),

    // ServeStaticModule.forRoot({
    //   rootPath: join(__dirname, '..', statticFileLocation),
    //   exclude: ['/api*'],
    // }),

    InstitutionModule,
    MasterdataModule,
    Userv2Module,
    ParameterModule,
    ProjectProgramModule,
    PolicyModule,
    ProjectStatusModule,
    DocumentModule,
    DatarequestStatusHistoryModule,
    ProjectProgramDataModule,
    FinanceModule,
    PolicyDataModule,
    ChartModule,
    PublicModule,
    UserDataUsageCategoryModule


  ],
  controllers: [AppController, ChartController, PublicController],
  providers: [AppService, IWOSAPIConfig, Userv2Service, UserTypeService, ChartService, PublicService, KeyClockService,
    // These are in order, see https://docs.nestjs.com/guards#binding-guards
    // for more information

    // This adds a global level authentication guard, you can also have it scoped
    // if you like.
    //
    // Will return a 401 unauthorized when it is unable to
    // verify the JWT token or Bearer header is missing.
    {
      provide: APP_GUARD,
      useClass: AuthGuard,
    },
    // This adds a global level resource guard, which is permissive.
    // Only controllers annotated with @Resource and methods with @Scopes
    // are handled by this guard.
    {
      provide: APP_GUARD,
      useClass: ResourceGuard,
    },
    // New in 1.1.0
    // This adds a global level role guard, which is permissive.
    // Used by `@Roles` decorator with the optional `@AllowAnyRole` decorator for allowing any
    // specified role passed.
    {
      provide: APP_GUARD,
      useClass: RoleGuard,
    }, EmailRemindersJobService],
})


export class AppModule implements NestModule {
  
  
  configure(consumer: MiddlewareConsumer) {
    console.log("AppLoggerMiddleware")
    consumer
      .apply(AppLoggerMiddleware)
      .forRoutes(AppController);
  }

  /**
   *
   */
   constructor() {
    console.log("process.env.authServerUrl", process.env.authServerUrl);
    console.log("AppModule creatting at ", join(__dirname, '..', 'static-files'));
    console.log("AppModule creatting at ", join(__dirname, '..', 'client'));
  }
  

}

