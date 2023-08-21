import { Test, TestingModule } from '@nestjs/testing';
import { UserDataUsageCategoryService } from './user-data-usage-category.service';

describe('UserDataUsageCategoryService', () => {
  let service: UserDataUsageCategoryService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UserDataUsageCategoryService],
    }).compile();

    service = module.get<UserDataUsageCategoryService>(UserDataUsageCategoryService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
