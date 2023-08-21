import { UomConversionService } from './../masterdata/uom-conversion/uom-conversion.service';
import { Controller, Get } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CreateManyDto, Crud, CrudController, CrudRequest, GetManyDefaultResponse, Override, ParsedBody, ParsedRequest } from '@nestjsx/crud';
import { Not, Repository } from 'typeorm';
import { Parameter } from './entity/parameter.entity';
import { UnitOfMeasure } from './entity/unitofmeasure.entity';
import { ParameterService } from './parameter.service';
import { UnitOfMeasureService } from './unitofmeasure.service';


@Crud({
    model: {
        type: UnitOfMeasure,
    },
    query: {
        join: {
            UomConversions: {
                eager: true,
            },
        }
    }


})

@Controller('unit-of-measure')
export class UnitOfMeasureController implements CrudController<UnitOfMeasure> {

    constructor(
        @InjectRepository(UnitOfMeasure)
        private readonly repository: Repository<UnitOfMeasure>,
        public service: UnitOfMeasureService, private uomConvertionService: UomConversionService,
    ) {

    }

    get base(): CrudController<UnitOfMeasure> {
        return this;
    }

    @Override()
    async createOne(
        @ParsedRequest() req: CrudRequest,
        @ParsedBody() dto: UnitOfMeasure,
    ): Promise<UnitOfMeasure> {
        const uom = await this.repository.findOne({ name: dto.name });

        if (uom) {
            return { ...new UnitOfMeasure(), status: 409 };
        }
        let newUOM = await this.base.createOneBase(req, dto);
        await this.uomConvertionService.ceateSelfConvertion(newUOM);
        return newUOM;
    }

    @Override()
    async updateOne(
        @ParsedRequest() req: CrudRequest,
        @ParsedBody() dto: UnitOfMeasure,
    ): Promise<UnitOfMeasure> {
        const uom = await this.repository.findOne({ name: dto.name, id: Not(dto.id) });

        if (uom) {
            return { ...new UnitOfMeasure(), status: 409 };
        }
        let updatedUOM = await this.base.updateOneBase(req, dto);
        console.log("zzzzzzzzzzzzzzz");
        console.log(updatedUOM);
        await this.uomConvertionService.ceateSelfConvertion(updatedUOM);
        return updatedUOM;
    }

    @Get('kind-of-quantity')
    async getKindOfQuantityList(): Promise<string[]> {
        const list = await this.repository.createQueryBuilder("UnitOfMeasure")
            .select('kindOfQuantity')
            .distinct(true)
            .getRawMany();
        let res = [];
        if (list && list.length > 0) {
            res = list.filter(obj => obj.kindOfQuantity).map(obj => obj.kindOfQuantity);
        }
        return res;
    }
}
