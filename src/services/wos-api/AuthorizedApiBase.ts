import { IWOSAPIConfig } from "../IWOSAPIConfig";

export class AuthorizedApiBase {
    
  
    protected constructor( private config: IWOSAPIConfig) {
      
    }
  
    protected transformOptions = (options: RequestInit): Promise<RequestInit> => {

      //console.log("",this.config)

      options.headers = {
        ...options.headers,
        "x-api-key": "yXLn2ujVplE4FwukJ1p62UvS9ILVEAda1kWR0xAg",
      };

      //console.log("AuthorizedApiBase->transformOptions",options.headers);

      return Promise.resolve(options);
    };
  }

  