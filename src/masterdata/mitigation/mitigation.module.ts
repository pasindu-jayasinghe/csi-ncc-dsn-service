import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { MitigationController } from './mitigation.controller';
import { MitigationService } from './mitigation.service';
import { Mitigation } from './entity/mitigation.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Mitigation])],
  controllers: [MitigationController],
  providers: [MitigationService],
  exports: [MitigationService]
})
export class MitigationModule { }
