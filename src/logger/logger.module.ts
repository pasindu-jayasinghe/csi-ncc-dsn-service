import { Module } from '@nestjs/common';
import { WMLogger } from '../services/logging/wm.logger.service';

@Module({
  providers: [WMLogger],
  exports: [WMLogger],
})
export class LoggerModule {

    constructor(){
        
    }

}