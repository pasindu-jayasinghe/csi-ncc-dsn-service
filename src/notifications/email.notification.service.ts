import { MailerService } from "@nestjs-modules/mailer";
import { ParameterLocationData } from "src/parameter/entity/parameter-location-data.entity";
import { ParameterLocation } from "src/parameter/entity/parameter-location.entity";
import { Parameter } from "src/parameter/entity/parameter.entity";
import { User } from "src/users/user.entity";
import * as moment from 'moment';
import { Injectable } from "@nestjs/common";
import { UsersService } from "src/users/users.service";
import { Userv2Service } from "src/userv2/userv2.service";
import { ParameterService } from "src/parameter/parameter.service";
import { ParameterLocationService } from "src/parameter/parameter-location.service";


const fs = require('fs')

@Injectable()
export class EmailNitificationService {

    constructor(private readonly mailerService: MailerService,  
        private usersService: Userv2Service, 
        private paramterService: ParameterService,
        private paramterLocationService: ParameterLocationService) {

    }


    async sendnewDataRequesteEmailParameter( parameterLocationData : ParameterLocationData  ) {

        let pl = this.paramterLocationService.findOne(parameterLocationData.parameterLocation.id)

        let users = await this.usersService.find({where : {institution : {id: (await pl).dataSource.id},userType : 3}});

        let paramter = await this.paramterService.findOne(parameterLocationData.parameterId)
        
        let emailTemplate = "";

        emailTemplate = fs.readFileSync('./src/template/email/data-request-parameter.html', 'utf8');

        // emailTemplate = emailTemplate.replace("[USER_NAME]", `${user.title} ${user.firstName} ${user.lastName}`  );
        emailTemplate = emailTemplate.replace("[USER_NAME]", `Institution Admin`  );
        emailTemplate = emailTemplate.replace("[Paramter_Name]", paramter.name );
        emailTemplate = emailTemplate.replace("[from]", moment( parameterLocationData.startDate).format("YYYY MMM DD") );
        emailTemplate = emailTemplate.replace("[to]",  moment( parameterLocationData.endDate).format("YYYY MMM DD") );
        emailTemplate = emailTemplate.replace("[Deadline]", moment( parameterLocationData.deadline).format("YYYY MMM DD") );

        // sned email 
        this
            .mailerService
            .sendMail({
                to: users.map(a => a.email),//user.email, // list of receivers
                from: 'no-reply-ncc-dsn@climatesi.com', // sender address
                subject: 'ncc-dsn : parameter data request', // Subject line
                //text: 'Your new wealth manager login password is : ' + tempPassword, // plaintext body
                html: emailTemplate, // HTML body content
            })
            .then((res) => {
                console.log("email sent sendnewDataRequesteEmailParameter ===============", res);
            })
            .catch((e) => {
                console.log("email error sendnewDataRequesteEmailParameter =====================", e);
            });
    }

    async sendnewDataEntryRequesteEmailParameter( parameterLocationData : ParameterLocationData  ) {

        let pl = this.paramterLocationService.findOne(parameterLocationData.parameterLocation.id)

        let user = await this.usersService.findOne({where :  {id : parameterLocationData.dataEntryUser.id}});

        let paramter = await this.paramterService.findOne(parameterLocationData.parameterId)
        
        let emailTemplate = "";

        emailTemplate = fs.readFileSync('./src/template/email/data-entry-request-parameter.html', 'utf8');

        emailTemplate = emailTemplate.replace("[USER_NAME]", `${user.title} ${user.firstName} ${user.lastName}`  );
        emailTemplate = emailTemplate.replace("[Paramter_Name]", paramter.name );
        emailTemplate = emailTemplate.replace("[from]", moment( parameterLocationData.startDate).format("YYYY MMM DD") );
        emailTemplate = emailTemplate.replace("[to]",  moment( parameterLocationData.endDate).format("YYYY MMM DD") );
        emailTemplate = emailTemplate.replace("[Deadline]", moment( parameterLocationData.dataEnteryDeadline).format("YYYY MMM DD") );

        // sned email 
        this
            .mailerService
            .sendMail({
                to: user.email,//user.email, // list of receivers
                from: 'no-reply-ncc-dsn@climatesi.com', // sender address
                subject: 'ncc-dsn : parameter data entry request', // Subject line
                //text: 'Your new wealth manager login password is : ' + tempPassword, // plaintext body
                html: emailTemplate, // HTML body content
            })
            .then((res) => {
                console.log("email sent sendnewDataRequesteEmailParameter ===============", res);
            })
            .catch((e) => {
                console.log("email error sendnewDataRequesteEmailParameter =====================", e);
            });
    }

}