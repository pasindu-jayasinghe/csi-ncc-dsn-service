import { CcImpactService } from './cc-impact.service';
import { ClimateImpact } from './../entity/climate-Impact.entity';
import { Crud, CrudController } from '@nestjsx/crud';
import { Controller } from '@nestjs/common';

@Crud({
    model: {
        type: ClimateImpact,
    }
})
@Controller('cc-impact')
export class CcImpactController implements CrudController<ClimateImpact> {

    constructor(public service: CcImpactService) {
    }
}
