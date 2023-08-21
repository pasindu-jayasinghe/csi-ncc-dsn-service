import { DivisionalSecretariat } from './divisional.secretariat.entity';
import { District } from './district.entity';
import { Province } from './provice.entity';
import { Institution } from './../../institution/institution.entity';
import { User } from './../../users/user.entity';
import { JoinColumn } from 'typeorm';
import { ParameterLocationData } from './../../parameter/entity/parameter-location-data.entity';
import { type } from 'os';
import { MasterData } from 'src/shared/entities/master.data.entity';
import { Column, Entity, ManyToOne } from 'typeorm';
import { ProjectProgramData } from 'src/project-program/entity/project-program-data.entity';
import { PolicyData } from 'src/policy/entity/policy-data.entity';

@Entity()
export class DataRequestStatusHistory extends MasterData {

    @Column()
    comment: string;

    @Column()
    userId: number;

    @Column()
    userName: string;

    @Column()
    statusId: number;

    @Column()
    statusText: string;

    @Column({ default: null, nullable: true })
    parameterId?: number;

    @ManyToOne(type => ParameterLocationData)
    @JoinColumn()
    parameterLocationData?: ParameterLocationData;

    @ManyToOne(type => ProjectProgramData)
    @JoinColumn()
    projectProgramData?: ProjectProgramData;

    @ManyToOne(type => PolicyData)
    @JoinColumn()
    policyData?: PolicyData;

    itemDetails: string;

    user: User;

    institution: Institution;

    province: Province;

    district: District;

    divisionalSecretariat: DivisionalSecretariat;

}