import { Test, TestingModule } from '@nestjs/testing';
import { UserDataUsageCategoryController } from './user-data-usage-category.controller';

describe('UserDataUsageCategory Controller', () => {
  let controller: UserDataUsageCategoryController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UserDataUsageCategoryController],
    }).compile();

    controller = module.get<UserDataUsageCategoryController>(UserDataUsageCategoryController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
