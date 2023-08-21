import { Test, TestingModule } from '@nestjs/testing';
import { UomConversionService } from './uom-conversion.service';

describe('UomConversionService', () => {
  let service: UomConversionService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UomConversionService],
    }).compile();

    service = module.get<UomConversionService>(UomConversionService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
