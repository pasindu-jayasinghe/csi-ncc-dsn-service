import { Test, TestingModule } from '@nestjs/testing';
import { ProjectProgramService } from './project-program.service';

describe('ProjectProgramService', () => {
  let service: ProjectProgramService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProjectProgramService],
    }).compile();

    service = module.get<ProjectProgramService>(ProjectProgramService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
