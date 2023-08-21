import { Test, TestingModule } from '@nestjs/testing';
import { UomConversionController } from './uom-conversion.controller';

describe('UomConversion Controller', () => {
  let controller: UomConversionController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UomConversionController],
    }).compile();

    controller = module.get<UomConversionController>(UomConversionController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
