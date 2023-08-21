import { Controller, Get, Query } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Crud, CrudController, CrudRequest, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { User } from 'src/users/user.entity';
import { Repository } from 'typeorm';
import { Policy } from './entity/policy.entity';
import { PolicyService } from './policy.service';
import { Request, Post, UseGuards } from '@nestjs/common';
import { query } from 'express';


@Crud({
    model: {
        type: Policy,
    },
    query: {
        join: {
            sector: {
                eager: true
            },
            climateChangeDataCategory: {
                eager: true
            },
            formulationInstitution: {
                eager: true
            }
        }
    }

})

@Controller('policy')
export class PolicyController implements CrudController<Policy> {

    constructor(public service: PolicyService,
        @InjectRepository(User)
        private readonly usersRepository: Repository<User>) {

    }


    get base(): CrudController<Policy> {
        return this;
    }

    @Override()
    async getMany(@ParsedRequest() req: CrudRequest, @Request() req2) {

        let userEmail = req2.user.email;

        let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });


        if (currentDBUser.userType.id != 1) {
            // not ccs admin , linit data for the users' institution 
            req.parsed.search['$and'].push({ 'formulationInstitution.id': (currentDBUser).institution.id });
        }

        return this.base.getManyBase(req);
    }


    @Override()
    async getOne(@ParsedRequest() req: CrudRequest, @Request() req2) {

        let userEmail = req2.user.email;

        let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });

        if (currentDBUser !== null && currentDBUser !== undefined) {
            if (currentDBUser.userType.id != 1) {
                // not ccs admin , linit data for the users' institution 
                req.parsed.search['$and'].push({ 'formulationInstitution.id': (currentDBUser).institution.id });
            }
        }

        return this.base.getOneBase(req);
    }



    @Override()
    async deleteOne(@ParsedRequest() req: CrudRequest) {
        const id = req.parsed.paramsFilter
            .find(f => f.field === 'id' && f.operator === '$eq').value;
        const res = await this.service.softDelete(id);
        return res;
    }

    @Override()
    async updateOne(@Request() request, @ParsedRequest() req: CrudRequest, @ParsedBody() dto: Policy) {
        console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        console.log(dto);
        console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
        let updateData = await this.base.updateOneBase(req, dto);
        console.log(updateData);

    }


    @Get('policylist/:page/:limit/:name/:sector/:ccdCatagary/:instutionId/:formulationInstitution/:isApprove')
    async getPolicyList( @Request() req,
        @Query('page') page: number = 1,
        @Query('limit') limit: number = 10,
        @Query('name') name: string,
        @Query('sector') sector: number,
        @Query('ccdCatagary') ccdCatagary: number,
        @Query('instutionId') instutionId: number,
        @Query('formulationInstitution') formulationInstitution: string,
        @Query('isApprove') isApprove: number): Promise<any> {

        let userEmail = req.user.email;
    
        let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });

        if (currentDBUser !== null && currentDBUser !== undefined) {
            if (currentDBUser.userType.id != 1) {
                // not ccs admin , linit data for the users' institution 
                instutionId =  (currentDBUser).institution.id;
            }
        }

        return await this.service.getPolicyList({
            limit: limit,
            page: page
        }, name, sector, ccdCatagary, instutionId, formulationInstitution, isApprove);
    }

}