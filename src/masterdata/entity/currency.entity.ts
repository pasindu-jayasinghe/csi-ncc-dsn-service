import { MasterData } from 'src/shared/entities/master.data.entity';
import { Entity, Column } from "typeorm";


@Entity()
export class Currency extends MasterData {
    @Column()
    multificationFactor: number;

}