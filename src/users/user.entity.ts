import { BaseEntity, Column, DeleteDateColumn, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryGeneratedColumn } from 'typeorm';
import * as bcript from "bcrypt";
import { BaseTrackingEntity } from 'src/shared/base.tracking.entity';
import { UserType } from './user.type.entity';
import { Exclude } from 'class-transformer';
import { Institution } from 'src/institution/institution.entity';


@Entity()
export class User extends BaseTrackingEntity {

  constructor() {
    super();
    this.salt = "n/a";
    this.status = 0;
    this.password = "";
    this.resetToken = "";
    //  this.abc = this.firstName + this.lastName;
  }

  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(type => UserType, { eager: true })
  @JoinColumn()
  userType: UserType;

  @Column()
  firstName: string;

  @Column()
  lastName: string;

  @Column({ unique: true })
  username: string;

  @Column({ unique: true })
  email: string;

  @Column()
  title: string;

  @ManyToOne(type => Institution, { eager: true })
  @JoinColumn()
  institution: Institution;


  @Column()
  designation: string;

  @Column()
  telephone: string;

  @Column()
  mobile: string;

  @Column()
  nic: string;


  @Exclude()
  @Column()
  salt: string;

  @Exclude()
  @Column()
  password: string;

  @Exclude()
  @Column()
  resetToken: string;

  @DeleteDateColumn()
  deletedAt?: Date;

  
  @Column({default : 0})
  canNotDelete? : boolean;

  fullName: string;

  updateFullName() {
    this.fullName = this.firstName + (this.lastName ? ' ' + this.lastName : '');
  }

  // abc: string = ()=>{  this.firstName + this.lastName};

  get fullname2() { return this.firstName; }

  private _fullname: string
  get fullname(): string {
    this._fullname = this.firstName + (this.lastName ? ' ' + this.lastName : '');
    return this._fullname;
  }

  set fullname(value: string) {
  }

  async validatePassword(password: string): Promise<boolean> {
    const hashPassword = await bcript.hash(password, this.salt);
    return hashPassword === this.password;
  }

  async validateResetToken(token: string): Promise<boolean> {
    return token === this.resetToken;
  }
}
