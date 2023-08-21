import {
    ExceptionFilter,
    Catch,
    ArgumentsHost,
    HttpException,
    HttpStatus,
  } from '@nestjs/common';

import { WMLogger } from '../../services/logging/wm.logger.service';

  
  @Catch()
  export class AllExceptionsFilter implements ExceptionFilter {

    constructor(private logger : WMLogger){
        this.logger.setContext("AllExceptionsFilter");
    }

    catch(exception: unknown, host: ArgumentsHost) {

    // log
    console.log("gobal exception", exception)
    this.logger.error(exception, "AllExceptionsFilter");


      const ctx = host.switchToHttp();
      const response = ctx.getResponse();
      const request = ctx.getRequest();
  
      const status =
        exception instanceof HttpException
          ? exception.getStatus()
          : HttpStatus.INTERNAL_SERVER_ERROR;
  
      response.status(status).json({
        statusCode: status,
        timestamp: new Date().toISOString(),
        path: request.url,
        ex : exception //TODO: only for POC
      });
    }
  }