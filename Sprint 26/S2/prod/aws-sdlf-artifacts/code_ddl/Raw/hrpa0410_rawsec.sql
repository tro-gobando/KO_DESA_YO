CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0410_rawsec(
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
TRANS string,
TVIAG string)
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
  's3://rawsec-koandina-prod/regional/sap/hrpa0410'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')