import { Test, TestingModule } from '@nestjs/testing';
import { CcImpactService } from './cc-impact.service';

describe('CcImpactService', () => {
  let service: CcImpactService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CcImpactService],
    }).compile();

    service = module.get<CcImpactService>(CcImpactService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
