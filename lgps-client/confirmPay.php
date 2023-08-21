<html>
    <head>
        <title>LGPS Sample PHP Client</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/sample.css" rel="stylesheet" type="text/css"></link>
    </head>
    <?php include 'lib/LGPSClient.php'; ?>
    <?php include 'lib/lgps_config.php'; ?>

    <body>
        <?php


	

        $service_code ="";
        if(isset ($_GET["serviceCode"])) {
            // $service_code = $_POST["serviceCode"];
            $service_code = $_GET["serviceCode"];
            Logger::getInstance()->error($service_code);

        }
        //$_GET['link']
        $tx_amount = "";
        
        if(isset ($_GET["transactionAmount"])) {
            // $tx_amount = $_POST["transactionAmount"];
            $tx_amount = $_GET["transactionAmount"];
            Logger::getInstance()->error($tx_amounts);

        }
        
        $tx_ref_no = "";
        
        if(isset ($_GET["transactionRefNo"])) {
            // $tx_ref_no = $_POST["transactionRefNo"];
            $tx_ref_no = $_GET["transactionRefNo"];
        }
                
        $return_url = "https://nccdsn.env.gov.lk/payment-api/lgps-client/response.php";
        
        $cipher_message = null;
 
        
echo $service_code;
echo $tx_amount;
echo $tx_ref_no; 

try {

           
 $lgpsClientReq = new LGPSClient(); //Create LGPSClient Object to handle Payment Request   
            
            $lgpsClientReq->setLogs(LOG_DIRECTORY_PATH,ENABLE_LOGS);

            $lgpsClientReq->setClientPublicKey(CLIENT_PUBLIC_KEY); //Set Client Public Key
            $lgpsClientReq->setClientPrivateKey(CLIENT_PRIVATE_KEY, CLIENT_KEY_PASSWORD); //Set Client Private Key
            $lgpsClientReq->setLgpsPublicKey(LGPS_PUBLIC_KEY); //Set LGPS public Key
            $lgpsClientReq->setServiceCode($service_code); //Set Service code to Payment request
            $lgpsClientReq->setTransactionRefNo($tx_ref_no); //Set Transaction Ref No. to Payment request
            $lgpsClientReq->setTransactionAmount($tx_amount); //Set Transaction Amount to Payment request
            $lgpsClientReq->setReturnURL($return_url); //Set Return URL to Payment request


            $cipher_message = $lgpsClientReq->getPaymentRequest(); //Generate Encrypted Payment Request  


            
        }
 catch (LGPSException $e) {

          Logger::getInstance()->error($e->getMessage());
     }



        ?>

<form id="payform" name="payform" method="post" action="https://testlgps.lankagate.gov.lk/lgps/accesslgps">
                                                            <INPUT TYPE="hidden" Value="<?php echo $cipher_message; ?>"
                                                                   name="clientPaymentRequest">
                                                        
                                                        <td width="32%" height="35"><input type="submit"
                                                                                           name="Pay" value="Pay">
                                                        </td></form>
<script>
// user no need to see the view, automaticaly submit the form
  document.getElementById("payform").submit();
</script>



        <table width="517" border="0" cellspacing="0" cellpadding="0"
               align="center">
            <tr>
                <td width="517" height="180">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table width="517" border="0" cellspacing="0" cellpadding="0"
                           height="185" align="center">
                        <tr>
                            <td height="185" valign="top" background="images/lgps_logo.gif">
                                <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td height="70"><div align="center" class="style2">
                                                LGPS Sample PHP Client Module <br> <br>- Confirm Your
                                                Test Payment -
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0"
                                                   cellpadding="0">
                                                       <?php if ($cipher_message != null) { ?>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts  style3"></div></td>
                                                        <td width="32%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts  style3">
                                                                <strong>Service Code</strong>
                                                            </div></td>
                                                        <td width="32%"><b>:</b> &nbsp;&nbsp;<?php echo $service_code ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Transaction Amount</strong>
                                                            </div></td>
                                                        <td width="32%"><b>:</b> &nbsp;&nbsp;<?php echo $tx_amount ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Transaction Ref No</strong>
                                                            </div></td>
                                                        <td width="32%"><b>:&nbsp;&nbsp;</b><?php echo $tx_ref_no ?>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">&nbsp;</td>

                                                        <!-- <form id="payform" name="payform" method="post" action="https://testlgps.lankagate.gov.lk/lgps/accesslgps">
                                                            <INPUT TYPE="hidden" Value="<?php echo $cipher_message; ?>"
                                                                   name="clientPaymentRequest">
                                                        
                                                        <td width="32%" height="35"><input type="submit"
                                                                                           name="Pay" value="Pay">
                                                        </td></form> -->

                                                    </tr>
                                                    <?php }  else { ?>
                                                    <tr>
                                                        <td class="error">
                                                            <?php
                                                                echo "<br><br>
                                                                Error in creating Encrypted Payment Request!<br>
                                                                Please check the log files to view the error details.
                                                                <br><br>";
                                                        
                                                            ?> 
                                                    </td>
                                                </tr>
                                               <?php }
                                                        ?> 

                                </table></td>
                        </tr>
                    </table></td>
            </tr>
        </table></td>
</tr>
</table>


</body>
</html>
