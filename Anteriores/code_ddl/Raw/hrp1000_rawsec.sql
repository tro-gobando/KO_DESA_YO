CREATE EXTERNAL TABLE db_koandina_regional_raw.hrp1000_rawsec(
MANDT string,
PLVAR string,
OTYPE string,
OBJID string,
ISTAT string,
BEGDA string,
ENDDA string,
LANGU string,
SEQNR string,
OTJID string,
INFTY string,
AEDTM string,
UNAME string,
REASN string,
HISTO string,
ITXNR string,
SHORT string,
STEXT string,
GDATE string,
MC_SHORT string,
MC_STEXT string,
MC_SEARK string)
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
  's3://rawsec-koandina-prod/regional/sap/hrp1000/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')