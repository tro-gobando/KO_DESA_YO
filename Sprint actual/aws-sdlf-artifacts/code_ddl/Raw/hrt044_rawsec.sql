CREATE EXTERNAL TABLE db_koandina_cl_raw.hrt044_rawsec(
PERNR STRING,
BEGDA STRING,
COD_UEN STRING,
COD_ZON STRING,
TERRITC STRING,
UNAME STRING,
AEDTM STRING
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
  's3://rawsec-koandina-prod/cl/sap/hrt044'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')