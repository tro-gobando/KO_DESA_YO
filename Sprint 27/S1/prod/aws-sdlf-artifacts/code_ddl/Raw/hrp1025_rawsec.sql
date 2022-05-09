CREATE EXTERNAL TABLE db_koandina_regional_raw.hrp1025_rawsec(
PLVAR string,
OTYPE string,
OBJID string,
SUBTY string,
ISTAT string,
BEGDA string,
ENDDA string,
VARYF string,
SEQNR string,
INFTY string,
OTJID string,
AEDTM string,
UNAME string,
REASN string,
HISTO string,
ITXNR string,
NYEARS string,
NMONTHS string,
N_TYPE string)
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
  's3://rawsec-koandina-dev/regional/sap/hrp1025/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')