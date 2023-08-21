import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { District } from './district.entity';

@Entity()
export class DivisionalSecretariat extends MasterData {
    
    @ManyToOne(type => District)
    @JoinColumn()
    district : District

}

