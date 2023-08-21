//SectorMOE
import { Controller } from '@nestjs/common';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse } from '@nestjsx/crud';
import { ClimateChangeDataCategoryService } from './climate-change-data-category.service';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { Parameter } from './entity/parameter.entity';
import { SectorMOE } from './entity/sector.moe.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterService } from './parameter.service';
import { SectorMOEService } from './sector-moe-service';
import { UnitOfMeasureService } from './unitofmeasure.service';


@Crud({
    model: {
        type: SectorMOE,
    },
    
})

@Controller('sector-moe')
export class SectorMOEController implements CrudController<SectorMOE> {

    constructor(public service : SectorMOEService){
        
    }
    

}
