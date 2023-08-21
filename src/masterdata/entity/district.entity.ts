import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { Province } from './provice.entity';

@Entity()
export class District extends MasterData {

    @ManyToOne(type => Province)
    @JoinColumn()
    province : Province

}
