import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { User } from 'src/users/user.entity';

@Injectable()
export class Userv2Service extends TypeOrmCrudService<User> {

    constructor(@InjectRepository(User) repo) {
        super(repo);
      }

      //softDelete
      async softDelete(id: number){
        this.repo.softDelete({id});
        return;
      }

}
