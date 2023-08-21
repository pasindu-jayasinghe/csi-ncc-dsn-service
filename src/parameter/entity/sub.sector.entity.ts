import { MasterData } from "src/shared/entities/master.data.entity";
import { Entity, JoinColumn, ManyToOne } from "typeorm";
import { Sector } from "./sector.entity";

@Entity()
export class SubSector extends MasterData {

    @ManyToOne(type => Sector)
    @JoinColumn()
    sector: Sector;
}