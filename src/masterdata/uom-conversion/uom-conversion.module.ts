import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { UomConversionService } from './uom-conversion.service';
import { UomConversionController } from './uom-conversion.controller';
import { UomConversion } from './entity/uom-conversion.entity';

@Module({
  imports: [TypeOrmModule.forFeature([UomConversion])],
  providers: [UomConversionService],
  controllers: [UomConversionController],
  exports: [UomConversionService]
})
export class UomConversionModule { }
