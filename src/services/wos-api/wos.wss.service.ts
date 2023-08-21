import { WMLogger } from '../../services/logging/wm.logger.service';

var WebSocket = require('ws');


export const kycStatusSuccess = [];

export class WOSWSSClient {
    
    
    socket : WebSocket ;
    
    constructor(private logger: WMLogger){

      this.logger.setContext("WOSWSSClient");

    }
    
    start() : void {
        
        this.socket = new WebSocket('wss://test1-acorn-ws.demo.wealthos.cloud/ws?x-token=yXLn2ujVplE4FwukJ1p62UvS9ILVEAda1kWR0xAg');
        
        this.socket.onopen = function() {
            console.log('Connected');
            this.send(
              JSON.stringify({
                event: 'events',
                data: 'test',
              }),
            );
            this.onmessage = function(data) {
              var res = JSON.parse(data.data);
              console.log("socket.onmessage", res);
              console.log("data.data.event", res?.event);
              console.log("data.data.object.status", res?.object?.status);
              if(res.event == "kyc.completed"){

                if(res.object.status == "success")
                {// kyc sucess

                    kycStatusSuccess.push(res.object.investor_id);
                    console.log("kycStatusSuccess : ", kycStatusSuccess);
                }
                let tempLogger = new WMLogger("socket.onopen.onmessage");
                tempLogger.log("kycStatusSuccess : ==============");
                tempLogger.log(kycStatusSuccess);

              }
            };
          };
    }

    shutdown() : void {
        this.socket.close();
    }

    protected isKycCompleted() : Promise<boolean> {
        return new Promise((resolve) => {
            setTimeout(resolve, 20000);
          });
    }

}