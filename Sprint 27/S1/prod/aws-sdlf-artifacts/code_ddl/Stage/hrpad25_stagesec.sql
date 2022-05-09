CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpad25_stagesec(
    ADATANR string,
    TPARTDOCNO string,
    MANZL string,
    BUDAT string,
    INTEX string,
    KKOST string,
    KWAER string,
    KOKRS string,
    KOSTL string,
    ZDATA string,
    BELNR string,
    CONFIRMED string,
    PASSED string,
    FAILED string,
    FOLLOW_UP string,
    CAATR string,
    PREVSCLAS string,
    PREVSOBID string,
    EVENT string,
    STATUS string,
    REFDOCNO string,
    REFDOCITEM string,
    DOCUMENTDATE string,
    POSTINGDATE string,
    DOCUNAME string,
    CREDITBELNR string,
    CREDITSTATUS string,
    SCOSTCENTER string,
    RECEIVEORDER string,
    RSALESORDER string,
    RSALESITEM string,
    ACTIVITYTYPE string,
    QUANTITY string,
    UNIT string,
    SOLD_TO string,
    BILL_TO string,
    PAYER string,
    SHIP_TO string,
    NET_PRICE string,
    TAX_PRICE string,
    PURCH_ORDER string,
    CC_TYPE string,
    CC_NUMBER string,
    CC_VALID_TO string,
    CC_NAME string,
    RWBSELEMENT string,
    PAY_STATUS string,
    CC_NUMBER_CHECK string,
    CC_AUTH_STATUS string,
    REFDOCSEQNR string,
    LEARN_STATUS string,
    ACCESS_COUNTER string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ( 
  'quoteChar'='\"', 
  'separatorChar'='\;') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrpad25/'
TBLPROPERTIES (
'compressionType'='SNAPPY')