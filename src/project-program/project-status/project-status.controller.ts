import { ProjectStatus } from './../entity/project-status.entity';
import { ProjectStatusService } from './project-status.service';
import { ProjectType } from './../entity/project-type.entity';
import { Crud, CrudController } from '@nestjsx/crud';
import { Controller } from '@nestjs/common';

@Crud({
    model: {
        type: ProjectStatus,
    },

})
@Controller('project-status')
export class ProjectStatusController implements CrudController<ProjectStatus> {
    constructor(public service: ProjectStatusService) {

    }
}
