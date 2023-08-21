import { Injectable } from '@nestjs/common';
import { Product_type } from './services/wos-api/wos.api.service';

@Injectable()
export class AppService {

  constructor() {

  }

  async getHello(): Promise<string> {

   

    return 'Hello World .....................!';
  }
}
