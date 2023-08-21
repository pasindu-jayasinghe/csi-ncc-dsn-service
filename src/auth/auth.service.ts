import { Injectable, Body } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { AuthCredentialDto } from './Dto/auth.credential.dto';

@Injectable()
export class  AuthService {
  constructor(
    private readonly usersService: UsersService,
    private readonly jwtService: JwtService,
  ) {}

  async validateUser(username: string, pass: string): Promise<any> {
    console.log("AuthService.validateUser ===============");
    
    const user = await this.usersService.findByUserName(username);
    if (user && user.password === pass) {
      const { password, ...result } = user;
      return result;
    }
    return null;
  }

  async login(authCredentialDto: AuthCredentialDto): Promise<any> {
    console.log("AuthService.login");
    const {username, password} = authCredentialDto;

    if(await this.usersService.validateUser(username, password)){
      const selectedUser= await  this.usersService.findByUserName(username);
      
      const payload = {usr: (await selectedUser).username, 
        fname: (selectedUser).firstName, 
        lname: (selectedUser).lastName, 
        roles : [(selectedUser).userType.name]};
        console.log("jwt payload ", payload);
      let token = this.jwtService.sign(payload);
      console.log("token", token);
      return {access_token: token};
    }
    else{
      return null;
    }
  }
}
