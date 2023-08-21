import { Currency } from 'src/masterdata/entity/currency.entity';
import { BaseTrackingEntity } from 'src/shared/base.tracking.entity';
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { DonorType } from './donor-type.entity';


@Entity()
export class ProjectFundingDetail extends BaseTrackingEntity {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    projectProgrammeId?: number;

    @Column()
    donor: string;

    @Column()
    donorType: DonorType

    @Column({ type: "decimal", precision: 10, scale: 2, default: null })
    initialInvestment?: number;

    @ManyToOne(type => Currency, { cascade: false })
    @JoinColumn()
    initialInvestmentCurrency?: Currency;

    @Column({ type: "decimal", precision: 10, scale: 2, default: null })
    annualFunding?: number;

    @ManyToOne(type => Currency, { cascade: false })
    @JoinColumn()
    annualFundingCurrency?: Currency;
}

