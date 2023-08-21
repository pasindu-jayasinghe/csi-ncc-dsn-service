import { RecentUpdateSummary } from './dto/recent-update-summary.dto';
import { RequestAssignSummary } from './dto/request-assign-summary.dto';
import { RequestSummary } from './dto/request-summary.dto';
import { InstitutionType } from 'src/institution/institution.type.entity';
import { Controller, Get, Param } from "@nestjs/common";
import { Crud, CrudController, CrudRequest, GetManyDefaultResponse, Override, ParsedRequest } from "@nestjsx/crud";
import { Institution } from "./institution.entity";
import { InstitutionService } from "./institution.service";
import { Request, Post, UseGuards } from '@nestjs/common';
import { basename } from 'path';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/users/user.entity';
import { Repository } from 'typeorm';


@Crud({
  model: {
    type: Institution,
  },
  query: {
    join: {
      category: {
        eager: true,
      },
      province: {
        eager: true,
      },
      district: {
        eager: true,
      },
      divisionalSecretariat: {
        eager: true,
      },
      parentInstitution: {
        eager: true,
      },
      type: {
        eager: true,
      },
      hierarchy: {
        eager: true,
      },


    }
  }
})
@Controller('institution')
export class InstitutionController implements CrudController<Institution> {
  constructor(public service: InstitutionService,
    @InjectRepository(User)
    private readonly usersRepository: Repository<User>,) { }


  get base(): CrudController<Institution> {
    return this;
  }

  @Override()
  //@UseInterceptors(InstitutionFilterInterceptor, CrudRequestInterceptor)
  async getMany(@ParsedRequest() req: CrudRequest, @Request() req2 ) :  Promise<GetManyDefaultResponse<Institution> | Institution[]>  {

    let userEmail =  req2.user.email;

    let currentDBUser = await this.usersRepository.findOne({where : {email : userEmail }});


    if(currentDBUser.userType.id != 1){
      // not ccs admin , linit data for the users' institution 
      req.parsed.search['$and'].push({ 'id': (currentDBUser).institution.id });
    }

    return this.base.getManyBase(req);
  }

  @Override()
  async deleteOne(@ParsedRequest() req: CrudRequest) {
    const id = req.parsed.paramsFilter
      .find(f => f.field === 'id' && f.operator === '$eq').value;
    const res = await this.service.softDelete(id);
    return res;
  }

  @Get('institution/getrequestsummary/:institutionId')
  async getRequestSummary(@Param('institutionId') institutionId: number): Promise<RequestSummary[]> {
    return await this.service.getRequestSummary(institutionId);
  }

  @Get('institution/getrecentupdatesummary/:institutionId')
  async getRecentUpdateSummary(@Param('institutionId') institutionId: number): Promise<RecentUpdateSummary[]> {
    return await this.service.getRecentUpdateSummary(institutionId);
  }

  @Get('institution/getrecentassignsummary/:institutionId')
  async getRecentAssignSummary(@Param('institutionId') institutionId: number): Promise<RequestAssignSummary[]> {
    return await this.service.getRecentAssignSummary(institutionId);
  }

}
