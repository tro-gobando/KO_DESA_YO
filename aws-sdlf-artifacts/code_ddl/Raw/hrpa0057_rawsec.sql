CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0057_rawsec(
PERNR STRING,
SUBTY STRING,
OBJPS STRING,
SPRPS STRING,
ENDDA STRING,
BEGDA STRING,
SEQNR STRING,
AEDTM STRING,
UNAME STRING,
HISTO STRING,
ITXEX STRING,
REFEX STRING,
ORDEX STRING,
ITBLD STRING,
PREAS STRING,
FLAG1 STRING,
FLAG2 STRING,
FLAG3 STRING,
FLAG4 STRING,
RESE1 STRING,
RESE2 STRING,
GRPVL STRING,
EMFSL STRING,
MTGLN STRING,
GRPRG STRING,
BETRG STRING,
WAERS STRING,
LGART STRING,
ANZHL STRING,
ZEINH STRING,
ZFPER STRING,
ZDATE STRING,
ZANZL STRING,
ZEINZ STRING,
PRITY STRING,
UFUNC STRING,
UNLOC STRING,
USTAT STRING,
ESRNR STRING,
ESRRE STRING,
ESRPZ STRING,
ZWECK STRING,
OPKEN STRING,
INDBW STRING,
ZSCHL STRING,
UWDAT STRING,
MODEL STRING,
MGART STRING,
BKREF STRING
)
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
  's3://rawsec-koandina-dev/regional/sap/hrpa0057'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')