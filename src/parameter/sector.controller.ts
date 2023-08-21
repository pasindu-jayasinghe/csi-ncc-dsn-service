import { Controller } from '@nestjs/common';
import {
  CreateManyDto,
  Crud,
  CrudController,
  CrudRequest,
  GetManyDefaultResponse,
  Override,
  ParsedRequest,
  ParsedBody,
} from '@nestjsx/crud';
import { Sector } from './entity/sector.entity';
import { SectorService } from './sector.service';
import { Not, Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Crud({
  model: {
    type: Sector,
  },
  query: {
    join: {
      climateChangeDataCategory: {
        eager: true,
      },
    }
  }
})
@Controller('sector')
export class SectorController implements CrudController<Sector> {
  constructor(
    @InjectRepository(Sector)
    private readonly repository: Repository<Sector>,
    public service: SectorService
  ) { }

  get base(): CrudController<Sector> {
    return this;
  }

  @Override()
  async createOne(
    @ParsedRequest() req: CrudRequest,
    @ParsedBody() dto: Sector,
  ): Promise<Sector> {
    const sector = await this.repository.findOne({ name: dto.name });

    if (sector) {
      return { ...new Sector(), status: 409 };
    }
    let newSector = await this.base.createOneBase(req, dto);
    return newSector;
  }

  @Override()
  async updateOne(
    @ParsedRequest() req: CrudRequest,
    @ParsedBody() dto: Sector,
  ): Promise<Sector> {
    const sector = await this.repository.findOne({ name: dto.name, id: Not(dto.id) });

    if (sector) {
      return { ...new Sector(), status: 409 };
    }

    let updatedSector = await this.base.updateOneBase(req, dto);
    return updatedSector;
  }
}
