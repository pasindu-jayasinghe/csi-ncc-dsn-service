<?php session_start(); ?>
<html>
    <head>
        <title>LGPS Sample PHP Client</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="css/sample.css" rel="stylesheet" type="text/css"></link>
    </head>

    <?php

    class Random {

        private static $RSeed = 0;

        public static function seed($s = 0) {
            self::$RSeed = abs(intval($s)) % 9999999 + 1;
            self::num();
        }

        public static function num($min = 0, $max = 9999999) {
            if (self::$RSeed == 0)
                self::seed(mt_rand());
            self::$RSeed = (self::$RSeed * 125) % 2796203;
            return self::$RSeed % ($max - $min + 1) + $min;
        }

    }
    ?>

    <?php
     $timestamp = time();
 //   $timestamp = $date->getTimestamp();
    Random::seed($timestamp);
//Generate Radom Transaction No
    $rand_tx_no = Random::num(1, 1000000);
    ?>
    <body>
        <form method="post" action="confirmPay.php">
            <table width="517" border="0" cellspacing="0" cellpadding="0"
                   align="center">
                <tr>
                    <td width="517" height="180">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table width="517" border="0" cellspacing="0" cellpadding="0" height="185" align="center">
                            <tr>
                                <td height="185" valign="top" background="images/lgps_logo.gif">
                                    <table width="100%" border="1" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="70"><div align="center" class="style2">
												LGPS Sample PHP Client Module <br>
                                                    <br>- Enter Test Payment Details -
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0"
                                                       cellpadding="0">
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
                                                        <td width="32%"><input type="text" name="serviceCode"
                                                                               value="TEST20001"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Transaction Amount</strong>
                                                            </div></td>
                                                        <td width="32%"><input type="text"
                                                                               name="transactionAmount" value="1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">
                                                            <div align="left" class="ctrlFonts">
                                                                <strong>Transaction Ref No</strong>
                                                            </div></td>
                                                        <td width="32%"><input type="text"
                                                                               name="transactionRefNo" value="<?php echo $rand_tx_no ?>"></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="41%" height="25">&nbsp;</td>
                                                        <td width="4%" height="25">&nbsp;</td>
                                                        <td width="40%" height="25">&nbsp;</td>
                                                        <td width="32%" height="35"><input type="submit"
                                                                                           name="Submit" value="Submit">
                                                        </td>
                                                    </tr>
                                                </table></td>
                                        </tr>
                                    </table></td>
                            </tr>
                        </table></td>
                </tr>
            </table>
        </form>
    </body>
</html>


