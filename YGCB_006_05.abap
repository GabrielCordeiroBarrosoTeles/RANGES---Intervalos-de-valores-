*&-------------------------------------------------------------------------------*
*& Report YGCB_006_05
*&-------------------------------------------------------------------------------*
*& RANGES -  Intervalos de valores                                               |
*&_______________________________________________________________________________|
*&  SIGN ->   I - Incluir | E - Exclude                                          |
*&_______________________________________________________________________________|
*&  OPTION -> EQ - Igual a                   | NE - Diferente de                 |
*&            GT - Maior que                 | LT - Menor que                    |
*&            GE - Maior ou igual a          | LE - Menor ou igual a             |
*&            BT - Entre                     | NB - Não entre                    |
*&            CP - Compatível com um padrão  | NP - Não compatível com um padrão |
*&_______________________________________________________________________________|
*&  LOW ->    Valor de                                                           |
*&  HIGH ->   Valor até                                                          |
*&-------------------------------------------------------------------------------*
REPORT YGCB_006_05.

 DATA: ld_carrid TYPE sflight-carrid,
       ld_currency TYPE sflight-currency,
       lt_carrid TYPE TABLE OF sflight.

 SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
   SELECT-OPTIONS: s_carrid FOR ld_carrid,
                   s_curr FOR ld_currency.
 SELECTION-SCREEN END OF BLOCK b1.

 START-OF-SELECTION.

 SELECT *
   INTO TABLE lt_carrid
   FROM sflight
   WHERE carrid   IN s_carrid
   AND   currency IN s_curr.
