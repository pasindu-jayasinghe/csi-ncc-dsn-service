import { Deadline } from './deadline.entity';
import { FrequencyDetail } from './frequency-details.entity';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { Entity, OneToMany, JoinTable, JoinColumn, ManyToOne } from "typeorm";

@Entity()
export class Frequency extends MasterData {

    @OneToMany(() => FrequencyDetail, frequencyDetail => frequencyDetail.frequency, {
        eager: true
    })

    @JoinTable()
    frequencyDetails: FrequencyDetail[];

    @ManyToOne(type => Deadline)
    @JoinColumn()
    deadline: Deadline;
}