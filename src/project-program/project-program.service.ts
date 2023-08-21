//ProjectProgramme
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { Institution } from 'src/institution/institution.entity';
import { ProjectProgramme } from './entity/project-programme.entity';

@Injectable()
export class ProjectProgramService extends TypeOrmCrudService<ProjectProgramme> {
    constructor(@InjectRepository(ProjectProgramme) repo) {
        super(repo);
      }

    getProjectsForDataRequests(requestedIdList: number[], dataSourceId: number, name: string){
      let projectFilter = "ProjectProgramme.id NOT IN (:...ids) AND dataSourceId = :dataSourceId";
      let params = {ids: requestedIdList.length > 0 ? requestedIdList : [0], dataSourceId: dataSourceId};

        if(name){
            projectFilter = projectFilter + " AND LOWER(ProjectProgramme.name) LIKE :name";
            params["name"] = `%${name}%`
        }                

        return this.repo.createQueryBuilder("ProjectProgramme")
                        .innerJoinAndMapOne('ProjectProgramme.dataSource', Institution, 'in', 'in.id = ProjectProgramme.dataSourceId')
                        .where(projectFilter, params)
    }  

    async softDelete(id: number){
      this.repo.softDelete({id});
      return;
    }
}