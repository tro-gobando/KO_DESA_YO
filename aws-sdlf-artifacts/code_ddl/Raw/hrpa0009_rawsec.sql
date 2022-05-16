CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0009_rawsec(
  PERNR string,
  SUBTY string,
  OBJPS string,
  SPRPS string,
  ENDDA string,
  BEGDA string,
  SEQNR string,
  AEDTM string,
  UNAME string,
  HISTO string,
  ITXEX string,
  REFEX string,
  ORDEX string,
  ITBLD string,
  PREAS string,
  FLAG1 string,
  FLAG2 string,
  FLAG3 string,
  FLAG4 string,
  RESE1 string,
  RESE2 string,
  GRPVL string,
  OPKEN string,
  BETRG string,
  WAERS string,
  ANZHL string,
  ZEINH string,
  BNKSA string,
  ZLSCH string,
  EMFTX string,
  BKPLZ string,
  BKORT string,
  BANKS string,
  BANKL string,
  BANKN string,
  BANKP string,
  BKONT string,
  SWIFT string,
  DTAWS string,
  DTAMS string,
  STCD1 string,
  STCD2 string,
  PSKTO string,
  ESRNR string,
  ESRRE string,
  ESRPZ string,
  EMFSL string,
  ZWECK string,
  BTTYP string,
  PAYTY string,
  PAYID string,
  OCRSN string,
  BONDT string,
  BKREF string,
  STRAS string,
  STATE string,
  DEBIT string,
  IBAN string,
  ADRS_BANKS string)
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
  's3://rawsec-koandina-prod/regional/sap/hrpa0009/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')