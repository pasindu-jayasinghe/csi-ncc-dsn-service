import { MitigationService } from './mitigation.service';
import { Crud, CrudController } from '@nestjsx/crud';
import { Controller } from '@nestjs/common';
import { Mitigation } from './entity/mitigation.entity';

@Crud({
    model: {
        type: Mitigation,
    },
})
@Controller('mitigation')
export class MitigationController implements CrudController<Mitigation> {
    constructor(public service: MitigationService) { }

}

