
<html>
    <head>
        <title>LGPS Sample PHP Client</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/sample.css" rel="stylesheet" type="text/css"></link>
    </head>
    <?php include 'lib/LGPSClient.php'; ?>
    <?php include 'lib/lgps_config.php'; ?>
    <?php
    // put your code here
    $d_response = $_POST["lgpsPaymentResponse"]; 
   // echo "lgpsPaymentResponse : ".$d_response;
    $receivedPaymentGatewayName = "";
    $receivedTransactionRefNo = "";
    $receivedTransactionStatus = "";
    $convenienceFee = "";
    $error = false;
    $returnUrl = "https://nccdsn.env.gov.lk/web-api/shopping-cart/checkout-response";
    
    try {
        
        $lgpsClientRes = new LGPSClient(); //Create LGPSClient Object
        $lgpsClientRes->setLogs(LOG_DIRECTORY_PATH,ENABLE_LOGS);
                     
        $lgpsClientRes->setClientPublicKey(CLIENT_PUBLIC_KEY); //Set Client Public Key
        $lgpsClientRes->setClientPrivateKey(CLIENT_PRIVATE_KEY, CLIENT_KEY_PASSWORD); //Set Client Private Key
        $lgpsClientRes->setLgpsPublicKey(LGPS_PUBLIC_KEY); //Set LGPS public Key

        $lgpsClientRes->setPaymentResponse($d_response); //Set Payment response    
        
        $receivedPaymentGatewayName = $lgpsClientRes->getReceivedPaymentGateway();   //Extract received Payment Gateway Name     
        $receivedTransactionRefNo = $lgpsClientRes->getReceivedTransactionRefNo();   //Extract received transaction ref no.             
        $receivedTransactionStatus = $lgpsClientRes->getReceivedTransactionStatus();  //Extract received transaction status 
	    $convenienceFee = $lgpsClientRes->getConvenienceFee();   //Extract received Payment Gateway convenienceFee
    
        $returnUrl .= "?transactionID=";
        $returnUrl .=  $receivedTransactionRefNo  ;
        $returnUrl .=  "&transactionStatus=" ;
        $returnUrl .=  $receivedTransactionStatus ;
        $returnUrl .=  "&transactionReferenceNumber=" ;
        $returnUrl .=  $receivedTransactionRefNo ;
        $returnUrl .=  "&paymentGatewayName=" ;
        $returnUrl .=  $receivedPaymentGatewayName ;
        $returnUrl .=  "&convenienceFee=" ;
        $returnUrl .=   $receivedPaymentGatewayName ;
        $returnUrl .=   "&dataHash=" . uniqid();
        

        Logger::getInstance()->error($returnUrl);


        header('Location: ' . $returnUrl, true, 302);
        
        die();

        
    } catch (LGPSException $e) {
        $error = true;
        Logger::getInstance()->error("Exception Occured: " . $e->getMessage());
    }
    ?>
    
    <body>
       
            <table width="517" border="0" cellspacing="0" cellpadding="0" align="center">
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
												LGPS Sample PHP Client Module <br>
                                                    <br>- Your Test Transaction Status -
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0"
                                                       cellpadding="0">
                                                       <?php if (!$error) { ?>
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
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Payment Gateway</strong>
                                                            </div></td>
                                                        <td width="32%"><?php echo $receivedPaymentGatewayName; ?></td>
                                                    </tr>
						    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Payment Gateway Convenience Fee</strong>
                                                            </div></td>
                                                        <td width="32%"><?php echo $convenienceFee; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts  style3">
                                                                <strong>Transaction Ref. No</strong>
                                                            </div></td>
                                                        <td width="32%"><?php echo $receivedTransactionRefNo; ?></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Transaction Status</strong>
                                                            </div></td>
                                                        <td width="32%"><?php echo $receivedTransactionStatus; ?></td>
                                                    </tr>

                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">&nbsp;</td>
                                                        <td width="32%" height="35"> 
                                                            <form method="post" action="index.php"><input type="submit"
                                                                                           name="Submit" value="OK"> </form>
                                                        </td>
                                                    </tr>
                                                </table></td>
                                        </tr>
                                         <?php }  else { ?>
                                                    <tr>
                                                        <td class="error">
                                                            <?php
                                                                echo "<br><br>
                                                                Error in Decrypted Payment Response!<br>
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
            </table>
       
    </body>
</html>
