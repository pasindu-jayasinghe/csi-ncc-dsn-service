import { Injectable, Scope, Logger } from '@nestjs/common';

const winston = require('winston');
const {  format } = require('winston');

const winstonlogger = winston.createLogger({
    level: 'info',
    //format: winston.format.json(),
    format: format.combine(
        format.timestamp({
            format: 'YYYY-MM-DD HH:mm:ss',
        }),
        format.printf((info) => info.timestamp + " \n" +
            JSON.stringify({
                level: info.level ,
                message: info.message ,
                info : info,
                //splat: info.splat !== undefined ? `${info.splat}` : '' ,
            }) + ','
        )
    ),
    //defaultMeta: { service: 'user-service' },
    transports: [
      //
      // - Write all logs with level `error` and below to `error.log`
      // - Write all logs with level `info` and below to `combined.log`
      //
      new winston.transports.File({ timestamp:true, filename: 'log-error.log', level: 'error' }),
      new winston.transports.File({ timestamp:true,  filename: 'log-all-combined.log' }),
      
    ],
    exceptionHandlers: [
        new winston.transports.File({ timestamp :true, filename: 'log-exceptions.log' })
      ],
      exitOnError: false, // <--- set this to false
  });
  
  //
  // If we're not in production then log to the `console` with the format:
  // `${info.level}: ${info.message} JSON.stringify({ ...rest }) `
  //
  //if (process.env.NODE_ENV !== 'production') {
    winstonlogger.add(new winston.transports.Console({
      format: winston.format.simple(),
    }));
  //}


@Injectable({ scope: Scope.TRANSIENT })
export class WMLogger extends Logger {

    error(message: any, trace?: string, context?: string): void{
        winstonlogger.log('error',context, message);        
    }
    log(message: any, context?: string): void {
        winstonlogger.log('info',context, message);        
    }
    warn(message: any, context?: string): void {
        winstonlogger.log('warn',context, message);        
    }
    debug(message: any, context?: string): void {
        winstonlogger.log('debug',context, message);     
    }

}