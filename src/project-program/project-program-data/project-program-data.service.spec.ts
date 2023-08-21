import { Test, TestingModule } from '@nestjs/testing';
import { ProjectProgramDataService } from './project-program-data.service';

describe('ProjectProgramDataService', () => {
  let service: ProjectProgramDataService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProjectProgramDataService],
    }).compile();

    service = module.get<ProjectProgramDataService>(ProjectProgramDataService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});