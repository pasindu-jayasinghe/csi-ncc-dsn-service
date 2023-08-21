import { Test, TestingModule } from '@nestjs/testing';
import { DatarequestStatusHistoryService } from './datarequest-status-history.service';

describe('DatarequestStatusHistoryService', () => {
  let service: DatarequestStatusHistoryService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [DatarequestStatusHistoryService],
    }).compile();

    service = module.get<DatarequestStatusHistoryService>(DatarequestStatusHistoryService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
