import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { AllExceptionsFilter } from './services/exception/AllExceptionsFilter';
import { WMLogger } from './services/logging/wm.logger.service';
import * as bodyParser from 'body-parser';
import { EscapeInterceptor } from './shared/EscapeInterceptor';
const helmet = require("helmet");
var xss = require('xss-clean');

//import * as Keycloak from 'keycloak-connect';
//var session = require('express-session');

require('dotenv').config();


async function bootstrap() {
  const app = await NestFactory.create(AppModule,  {
    logger: ['log', 'error', 'warn', 'debug'], // 'log', 'error', 'warn', 'debug', and 'verbose'.
  });




  app.useGlobalInterceptors(new EscapeInterceptor());



  const options = new DocumentBuilder()
    .setTitle('NCC DSN')
    .setDescription('NCC DSN')
    .setVersion('1.0')
    .addTag('DSN')
    .addCookieAuth('optional-session-id')
    .build();
  const document = SwaggerModule.createDocument(app, options);
  SwaggerModule.setup('api', app, document);
  app.enableCors();


  app.useGlobalFilters(new AllExceptionsFilter(new WMLogger()));

  app.use(bodyParser.json({limit: '31mb'}));
  app.use(bodyParser.urlencoded({limit: '31mb', extended: true}));
  ​
  //var memoryStore = new session.MemoryStore();
  //var keycloak = new Keycloak({ store: memoryStore });

  //app.use( keycloak.middleware() );

app.use(helmet.contentSecurityPolicy());
app.use(helmet.dnsPrefetchControl());
app.use(helmet.expectCt());
app.use(helmet.frameguard());
app.use(helmet.hidePoweredBy());
app.use(helmet.hsts());
app.use(helmet.ieNoOpen());
app.use(helmet.noSniff());
app.use(helmet.permittedCrossDomainPolicies());
app.use(helmet.referrerPolicy());
app.use(helmet.xssFilter());

console.log("process.env.appListnHostname", process.env.appListnHostname);
console.log("process.env.appListnHostname", process.env.appListnHostname || "127.0.0.1");

  await app.listen(7080, process.env.appListnHostname);
}
bootstrap();
