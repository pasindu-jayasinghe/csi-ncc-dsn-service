import { Crud, CrudController, CrudRequest, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { Controller } from '@nestjs/common';
import { ProjectFundingDetail } from '../entity/project-funding-detail.entity';
import { ProjectFundingDetailService } from './project-funding-detail.service';
import { Not, Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Crud({
    model: {
        type: ProjectFundingDetail,
    },
    query: {
        join: {
            initialInvestmentCurrency: {
                eager: true
            },
            annualFundingCurrency: {
                eager: true
            }
        }
    }

})
@Controller('project-funding-detail')
export class ProjectFundingDetailController implements CrudController<ProjectFundingDetail> {
    constructor(@InjectRepository(ProjectFundingDetail)
                private readonly repository: Repository<ProjectFundingDetail>, 
                public service: ProjectFundingDetailService) {}

    get base(): CrudController<ProjectFundingDetail> {
        return this;
    }
    
    @Override()
    async createOne(
        @ParsedRequest() req: CrudRequest,
        @ParsedBody() dto: ProjectFundingDetail,
    ) : Promise<ProjectFundingDetail>{
        const record = await this.repository.findOne({donor: dto.donor, projectProgrammeId: dto.projectProgrammeId});
    
        if (record) {
          return { ...new ProjectFundingDetail(), status: 409 };
        }
        let newRecord = await this.base.createOneBase(req, dto);
        return newRecord;
    }
    
    @Override()
    async updateOne(
        @ParsedRequest() req: CrudRequest,
        @ParsedBody() dto: ProjectFundingDetail,
    ) : Promise<ProjectFundingDetail> {
        const record = await this.repository.findOne({donor: dto.donor, projectProgrammeId: dto.projectProgrammeId, id: Not(dto.id)});
    
        if (record) {
          return { ...new ProjectFundingDetail(), status: 409 };
        }
    
        let updatedRecord = await this.base.updateOneBase(req, dto);
        return updatedRecord;
    }  
}