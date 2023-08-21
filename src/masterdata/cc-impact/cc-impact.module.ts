import { ClimateImpact } from './../entity/climate-Impact.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { CcImpactService } from './cc-impact.service';
import { CcImpactController } from './cc-impact.controller';

@Module({
  imports: [TypeOrmModule.forFeature([ClimateImpact])],
  providers: [CcImpactService],
  controllers: [CcImpactController],
  exports: [CcImpactService]

})
export class CcImpactModule { }
