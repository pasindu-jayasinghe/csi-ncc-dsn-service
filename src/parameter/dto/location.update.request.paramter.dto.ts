import { classToClass } from "class-transformer";
import { ParameterLocation } from "../entity/parameter-location.entity";

export class ParameterLocationUpdateRequestDto{
    parameterId : number;
    parameterLocations : ParameterLocation[];
    locationName : string;
}