import { Test, TestingModule } from '@nestjs/testing';
import { CcImpactController } from './cc-impact.controller';

describe('CcImpact Controller', () => {
  let controller: CcImpactController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CcImpactController],
    }).compile();

    controller = module.get<CcImpactController>(CcImpactController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
