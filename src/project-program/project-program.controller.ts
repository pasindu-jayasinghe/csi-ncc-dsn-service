import { ProjectType } from './entity/project-type.entity';
import { ProjectStatus } from './entity/project-status.entity';
import { Controller, Param } from '@nestjs/common';
import { Crud, CrudController, CrudRequest, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { ProjectProgramme } from './entity/project-programme.entity';
import { ProjectProgramService } from './project-program.service';
import { Sector } from 'src/parameter/entity/sector.entity';
import { Request, Post, UseGuards } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from 'src/users/user.entity';



@Crud({
    model: {
        type: ProjectProgramme,
    },
    query: {
        join: {
            dataSource: {
                eager: true
            },
            sector: {
                eager: true
            },
            subSector: {
                eager: true
            },
            climateChangeDataCategory: {
                eager: true
            },
            projectType: {
                eager: true
            },
            projectStatus: {
                eager: true
            },
            province: {
                eager: true
            },
            district: {
                eager: true
            },
            divisionalSecretariat: {
                eager: true
            },
            totalProjectCostCurrency: {
                eager: true
            },
            financingScheme: {
                eager: true
            },
            directSDBenefit: {
                eager: true
            },
            indirectSDBenefit: {
                eager: true
            }
        }
    }

})

@Controller('project-program')
export class ProjectProgramController implements CrudController<ProjectProgramme> {
    constructor(public service: ProjectProgramService,
        @InjectRepository(User)
        private readonly usersRepository: Repository<User>) {
    }

    get base(): CrudController<ProjectProgramme> {
        return this;
    }

    @Override()
    async getOne(@ParsedRequest() req: CrudRequest, @Request() req2) {

        let userEmail = req2.user.email;

        let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });

        if (currentDBUser !== undefined && currentDBUser !== null) {
            if (currentDBUser.userType.id != 1) {
                // not ccs admin , linit data for the users' institution 
                req.parsed.search['$and'].push({ 'dataSource.id': (currentDBUser).institution.id });
            }
        }

        return this.base.getOneBase(req);
    }

    @Override()
    async getMany(@ParsedRequest() req: CrudRequest, @Request() req2) {

        let userEmail = req2.user.email;

        let currentDBUser = await this.usersRepository.findOne({ where: { email: userEmail } });


        if (currentDBUser.userType.id != 1) {
            // not ccs admin , linit data for the users' institution 
            req.parsed.search['$and'].push({ 'dataSource.id': (currentDBUser).institution.id });
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
}
