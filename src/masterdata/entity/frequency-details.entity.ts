import { Frequency } from './frequency.entity';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, Entity, ManyToOne, JoinColumn } from 'typeorm';

@Entity()
export class FrequencyDetail extends MasterData {

    @ManyToOne(type => Frequency, frequency => frequency.frequencyDetails)
    @JoinColumn()
    frequency: Frequency;

    @Column()
    numberOfDate: number;

    @Column()
    numberofMonth: number;

    @Column()
    numberOfYear: number;

}