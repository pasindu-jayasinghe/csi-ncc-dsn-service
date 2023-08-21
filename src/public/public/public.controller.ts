import { AllowAnyRole } from 'nest-keycloak-connect';
import { PublicService } from './public.service';
import { Controller, Get, Query } from '@nestjs/common';

@Controller('public')
export class PublicController {

    constructor(private publicService: PublicService) {

    }

    @Get('public-getProjectViewPageDetails/:page/:limit/:name/:dateofCommence/:sector/:ccdCatagary/:status/:location')
    //@AllowAnyRole()
    async getProjectViewPageDetails(
        @Query('page') page: number = 1,
        @Query('limit') limit: number = 10,
        @Query('name') name: string,
        @Query('dateofCommence') dateofCommence: number,
        @Query('sector') sector: number,
        @Query('ccdCatagary') ccdCatagary: number,
        @Query('status') status: number,
        @Query('location') location: string): Promise<any> {

        return await this.publicService.getProjectViewPageDetails({
            limit: limit,
            page: page
        }, name, dateofCommence, sector, ccdCatagary, status, location);
    }

    @Get('public-getPolicyViewPageDetails/:page/:limit/:name/:sector/:ccdCatagary/:influenceId')
    async getPolicyViewPageDetails(
        @Query('page') page: number = 1,
        @Query('limit') limit: number = 10,
        @Query('name') name: string,
        @Query('sector') sector: number,
        @Query('ccdCatagary') ccdCatagary: number,
        @Query('influenceId') influenceId: number): Promise<any> {

        return await this.publicService.getPolicyViewPageDetails({
            limit: limit,
            page: page
        }, name, sector, ccdCatagary, influenceId);
    }

    @Get('public-getProjectViewinfo/:id')
    async getProjectViewinfo(@Query('id') id: number) {
        return await this.publicService.getProjectViewinfo(id);
    }



}
