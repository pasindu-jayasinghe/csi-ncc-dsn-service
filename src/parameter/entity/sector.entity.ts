import { ClimateChangeDataCategory } from './climate.change.data.category.entity';
import { MasterData } from "src/shared/entities/master.data.entity";
import { Entity, ManyToOne, JoinColumn } from "typeorm";

@Entity()
export class Sector extends MasterData {

    @ManyToOne(type => ClimateChangeDataCategory)
    @JoinColumn()
    climateChangeDataCategory: ClimateChangeDataCategory;

}