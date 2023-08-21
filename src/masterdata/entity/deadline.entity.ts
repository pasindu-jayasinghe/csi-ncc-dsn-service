import { MasterData } from 'src/shared/entities/master.data.entity';
import { Entity, Column } from 'typeorm';

@Entity()
export class Deadline extends MasterData {

    @Column()
    addAmount: number;

    @Column()
    addType: string;

    @Column()
    notifyBefore: number;

    @Column({ default: 0 })
    numberOfDays: number;

}