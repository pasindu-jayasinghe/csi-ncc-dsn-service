import { Controller } from '@nestjs/common';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse } from '@nestjsx/crud';
import { ClimateChangeDataCategoryService } from './climate-change-data-category.service';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { Parameter } from './entity/parameter.entity';
import { SubSector } from './entity/sub.sector.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterService } from './parameter.service';
import { SubSectorService } from './sub-sector.service';
import { UnitOfMeasureService } from './unitofmeasure.service';


@Crud({
    model: {
        type: SubSector,
    },
    
})

@Controller('sub-sector')
export class SubSectorController implements CrudController<SubSector> {

    constructor(public service : SubSectorService){
        
    }
    

}