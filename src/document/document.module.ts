import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { DocumentService } from './document.service';
import { DocumentController } from './document.controller';
import { Documents } from './entity/document.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Documents])],
  providers: [DocumentService],
  controllers: [DocumentController]
})

export class DocumentModule { }
