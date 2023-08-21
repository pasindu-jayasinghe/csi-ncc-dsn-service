import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from "@nestjs/common";
import { Observable } from "rxjs";

@Injectable()
export class InstitutionFilterInterceptor implements NestInterceptor {
  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    const req = context.switchToHttp().getRequest();
    // console.log("InstitutionFilterInterceptor==========",req);
    // req.query.filter = [];
    // //req.query.filter.push({field : 'id', operator: '$eq',value : 1})
    // req.query.filter = 'id||eq||' + 1
    // console.log("InstitutionFilterInterceptor==========",req.query);

    //req.query.filter = 'userId||eq||' + req.user.id
    return next.handle();
  }
}
