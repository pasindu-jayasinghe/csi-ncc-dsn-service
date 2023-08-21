import { Test, TestingModule } from '@nestjs/testing';
import { MitigationController } from './mitigation.controller';

describe('Mitigation Controller', () => {
  let controller: MitigationController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [MitigationController],
    }).compile();

    controller = module.get<MitigationController>(MitigationController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
