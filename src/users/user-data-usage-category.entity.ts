import { BaseTrackingEntity } from 'src/shared/base.tracking.entity';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { DataUsageCategory } from './data-usage-category.entity';

@Entity()
export class UserDataUsageCategory extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    email: string;

    @ManyToOne(type => DataUsageCategory, { eager: true })
    @JoinColumn()
    dataUsageCategory: DataUsageCategory;

}