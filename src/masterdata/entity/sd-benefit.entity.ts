import { MasterData } from 'src/shared/entities/master.data.entity';
import { Entity, Column } from 'typeorm';

@Entity()
export class SDBenefit extends MasterData {

    @Column()
    isDirectBenefit: boolean;

    @Column()
    isInDirectBenefit: boolean;

}