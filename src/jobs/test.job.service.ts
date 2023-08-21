import { Injectable, Logger } from '@nestjs/common';
import { Cron, Timeout } from '@nestjs/schedule';

@Injectable()
export class EmailRemindersJobService {
    private readonly logger = new Logger(EmailRemindersJobService.name);

    //HELP : https://docs.nestjs.com/techniques/task-scheduling#task-scheduling

    @Cron('* 30 * * * *')
    handleCron() {
        this.logger.debug('Called when the current second is 45');
        console.log('Called when the current second is 45');
    }

    @Timeout('notifications', 5000)
    handleTimeout() {
        this.logger.debug('Called once after 5 seconds');
    }
}