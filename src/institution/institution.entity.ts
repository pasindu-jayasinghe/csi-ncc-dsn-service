import { District } from 'src/masterdata/entity/district.entity';
import { DivisionalSecretariat } from 'src/masterdata/entity/divisional.secretariat.entity';
import { Hierarchy } from 'src/masterdata/entity/Hierarchy.entity';
import { Province } from 'src/masterdata/entity/provice.entity';
import { BaseTrackingEntity } from 'src/shared/base.tracking.entity';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, DeleteDateColumn, Entity, Index, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { InstitutionCategory } from './institution.category.entity';
import { InstitutionType } from './institution.type.entity';

@Entity()
export class Institution extends BaseTrackingEntity {

    /**
     *
     */
    constructor() {
        super();
        this.status = 0;
        this.sortOrder = 0;
        this.isNational = false;
    }

    @PrimaryGeneratedColumn()
    id: number;

    @Column({ unique: true })
    name: string;

    @Column({length: 2500})
    description: string;

    @Column()
    sortOrder: number

    @ManyToOne(type => InstitutionCategory)
    @JoinColumn()
    category: InstitutionCategory;

    @ManyToOne(type => InstitutionType)
    @JoinColumn()
    type: InstitutionType;

    @Column()
    isNational: boolean;

    @ManyToOne(type => Province)
    @JoinColumn()
    province?: Province;

    @ManyToOne(type => Hierarchy)
    @JoinColumn()
    hierarchy?: Hierarchy;

    @ManyToOne(type => District)
    @JoinColumn()
    district?: District;

    @ManyToOne(type => DivisionalSecretariat)
    @JoinColumn()
    divisionalSecretariat?: DivisionalSecretariat;

    @ManyToOne(type => Institution)
    @JoinColumn()
    parentInstitution?: Institution;

    
    @DeleteDateColumn()
    deletedAt?: Date;

    @Column({default : 0})
    canNotDelete? : boolean;

}
