CREATE EXTERNAL TABLE db_koandina_br_raw.hrp9911_rawsec(
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
LIMITE_EXEC string
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
  's3://rawsec-koandina-prod/br/sap/hrp9911'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')