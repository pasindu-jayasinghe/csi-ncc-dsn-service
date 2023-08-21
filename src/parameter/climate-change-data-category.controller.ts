//ClimateChangeDataCategory
import { Controller } from '@nestjs/common';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse } from '@nestjsx/crud';
import { ClimateChangeDataCategoryService } from './climate-change-data-category.service';
import { ClimateChangeDataCategory } from './entity/climate.change.data.category.entity';
import { Parameter } from './entity/parameter.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterService } from './parameter.service';
import { UnitOfMeasureService } from './unitofmeasure.service';


@Crud({
    model: {
        type: ClimateChangeDataCategory,
    },
    
})

@Controller('climate-change-data-category')
export class ClimateChangeDataCategoryController implements CrudController<ClimateChangeDataCategory> {

    constructor(public service : ClimateChangeDataCategoryService){
        
    }
    

}
