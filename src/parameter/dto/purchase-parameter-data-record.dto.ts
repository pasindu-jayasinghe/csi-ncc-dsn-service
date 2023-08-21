import { ParameterDataType } from './../entity/parameter-data-type.entity';
export class PurchaseParameterDataRecordDto {
    parameterDataId: number;
    parameterId: number;
    name: string;
    description: string;
    location: any;
    dataProvider: string;
    value: string;
    unit: string;
    validTimeDuration: string;
    dataValidFrom: Date;
    dataValidTo: Date;
    isPublicData: boolean;
    commercialValue: number;
    frequency: string;
    isInActiveCart: boolean;
    isAlreadyPurchased: boolean;
    parameterDataType: ParameterDataType;
    contentComment: string;
    documentList: any[];
}