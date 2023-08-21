import { Test, TestingModule } from '@nestjs/testing';
import { DatarequestStatusHistoryController } from './datarequest-status-history.controller';

describe('DatarequestStatusHistory Controller', () => {
  let controller: DatarequestStatusHistoryController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [DatarequestStatusHistoryController],
    }).compile();

    controller = module.get<DatarequestStatusHistoryController>(DatarequestStatusHistoryController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
