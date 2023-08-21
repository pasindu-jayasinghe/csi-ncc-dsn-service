import { Test, TestingModule } from '@nestjs/testing';
import { ProjectProgramDataController } from './project-program-data.controller';

describe('ProjectProgramDataController', () => {
  let controller: ProjectProgramDataController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ProjectProgramDataController],
    }).compile();

    controller = module.get<ProjectProgramDataController>(ProjectProgramDataController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
