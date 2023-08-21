import { Test, TestingModule } from '@nestjs/testing';
import { ProjectProgramController } from './project-program.controller';

describe('ProjectProgram Controller', () => {
  let controller: ProjectProgramController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ProjectProgramController],
    }).compile();

    controller = module.get<ProjectProgramController>(ProjectProgramController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
