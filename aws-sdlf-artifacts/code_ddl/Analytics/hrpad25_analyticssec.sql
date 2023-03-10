CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpad25_analyticssec(
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
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrpad25/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')