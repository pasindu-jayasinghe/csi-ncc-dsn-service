import { promises } from 'fs';
import { UnitOfMeasure } from 'src/parameter/entity/unitofmeasure.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Injectable } from '@nestjs/common';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { UomConversion } from './entity/uom-conversion.entity';

@Injectable()
export class UomConversionService extends TypeOrmCrudService<UomConversion> {
    constructor(@InjectRepository(UomConversion) repo) {
        super(repo);
    }

    async isHasSelfConvertion(unit: UnitOfMeasure) {
        let value = await this.repo.find({ where: { unitOfMeasure: { id: unit.id }, relatedUnitOfMeasure: { id: unit.id } } });
        if (value != undefined && value != null && value.length > 0) {
            // console.log(" isHasSelfConvertion" + true);
            return true;
        }
        else {
            // console.log(" isHasSelfConvertion" + false);
            false;
        }
    }

    async ceateSelfConvertion(dto: UnitOfMeasure) {
        if (!await this.isHasSelfConvertion(dto)) {
            let selfConvert: UomConversion = new UomConversion();
            selfConvert.conversionValue = 1;
            selfConvert.unitOfMeasure = dto;
            selfConvert.relatedUnitOfMeasure = dto;
            selfConvert.createdBy = dto.createdBy;
            selfConvert.createdOn = dto.createdOn;
            selfConvert.editedBy = dto.editedBy;
            selfConvert.editedOn = dto.editedOn;

            let newselfConvert = await this.repo.save(selfConvert);
            //console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxx");
        }
        else {
            // console.log("YYYYYYYYYYYYYYYYYYYYYYYYYYYY");
        }
    }

    async isHasReverseConvertion(unit: UomConversion) {
        let value = await this.repo.find({ where: { unitOfMeasure: { id: unit.relatedUnitOfMeasure.id }, relatedUnitOfMeasure: { id: unit.unitOfMeasure.id } } });
        if (value != undefined && value != null && value.length > 0) {
            // console.log("isHasReverseConvertion" + true);
            return true;
        }
        else {
            //console.log("isHasReverseConvertion" + false);
            false;
        }
    }

    async ceateReverseConvertion(dto: UomConversion) {
        if (!await this.isHasReverseConvertion(dto)) {
            let reverseConvert: UomConversion = new UomConversion();
            reverseConvert.conversionValue = 1 / dto.conversionValue;
            reverseConvert.unitOfMeasure = dto.relatedUnitOfMeasure;
            reverseConvert.relatedUnitOfMeasure = dto.unitOfMeasure;
            reverseConvert.createdBy = dto.createdBy;
            reverseConvert.createdOn = dto.createdOn;
            reverseConvert.editedBy = dto.editedBy;
            reverseConvert.editedOn = dto.editedOn;

            let newselfConvert = await this.repo.save(reverseConvert);
        }
    }

    async updateReverseConvertion(dto: UomConversion) {
        let value = await this.repo.findOne({ where: { unitOfMeasure: { id: dto.relatedUnitOfMeasure.id }, relatedUnitOfMeasure: { id: dto.unitOfMeasure.id } } });

        if (value) {

            value.conversionValue = 1 / dto.conversionValue;
            value.editedBy = dto.editedBy;
            value.editedOn = dto.editedOn;

            let newselfConvert = await this.repo.update(value.id, value);
        }
    }
}
