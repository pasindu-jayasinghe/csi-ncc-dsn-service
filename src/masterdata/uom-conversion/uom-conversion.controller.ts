import { UomConversionService } from './uom-conversion.service';
import { UomConversion } from './entity/uom-conversion.entity';
import { Crud, CrudController, Override, ParsedBody, ParsedRequest, CrudRequest } from '@nestjsx/crud';
import { Controller, Request } from '@nestjs/common';


@Crud({
    model: {
        type: UomConversion,
    },
    query: {
        join: {
            unitOfMeasure: {
                eager: true
            },
            relatedUnitOfMeasure: {
                eager: true
            },
        }
    }

})
@Controller('uom-conversion')
export class UomConversionController implements CrudController<UomConversion> {

    constructor(public service: UomConversionService) {
    }

    get base(): CrudController<UomConversion> {
        return this;
    }

    @Override()
    async createOne(@Request() request, @ParsedRequest() req: CrudRequest, @ParsedBody() dto: UomConversion) {

        let newplData = await this.base.createOneBase(req, dto);
        await this.service.ceateSelfConvertion(dto.unitOfMeasure);
        await this.service.ceateReverseConvertion(dto);
    }

    @Override()
    async updateOne(@Request() request, @ParsedRequest() req: CrudRequest, @ParsedBody() dto: UomConversion) {
        let updateData = await this.base.updateOneBase(req, dto);
        await this.service.updateReverseConvertion(updateData);

    }


}
