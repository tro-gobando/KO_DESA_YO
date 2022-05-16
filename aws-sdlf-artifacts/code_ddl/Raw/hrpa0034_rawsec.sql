CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0034_rawsec(
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
FUNKT STRING,
DAT34 STRING
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
  's3://rawsec-koandina-prod/regional/sap/hrpa0034'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')