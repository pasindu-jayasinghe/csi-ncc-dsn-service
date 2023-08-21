import { Injectable, NestInterceptor, ExecutionContext, CallHandler } from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import * as moment from 'moment';

var clean = require('xss-clean/lib/xss').clean;



@Injectable()
export class EscapeInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    //let s = new Sanitizer()
    console.log("EscapeInterceptor===============================>>>>>>>>>>>>>>>>>>>>>>")
    
    return next
      .handle()
      //.pipe(map(value =>   ("" + value).replace("<","").replace(">","").replace("&","").replace("<","")  )); //Replaces <, >, &, ', " and / with HTML entities.
      .pipe(map(value => EscapeInterceptor.recursivelyStripNullValues(value)));
   
  }


   static recursivelyStripNullValues(value: unknown): unknown {

    //console.log("recursivelyStripNullValues ================== ", value);

    var ivd = Date.parse(""+value);
    //console.log("ivd===============",ivd);
    if(!isNaN(ivd)){
      //console.log("date not scaped ================== ", value);
      return value;
    } 

    if (Array.isArray(value)) {
      //console.log("recursivelyStripNullValues is array ================== ", value);

      return value.map(EscapeInterceptor.recursivelyStripNullValues);
    }
    if (value !== null && typeof value === 'object') {

    //console.log("recursivelyStripNullValues is object ================== ", value);


      return Object.fromEntries(
        Object.entries(value).map(([key, value]) => [key, EscapeInterceptor.recursivelyStripNullValues(value)])
      );
    }
    if (value !== null) {

      
        //console.log("date escaped other ================== ", value);

        return clean(value);
      

    }
  }
}
