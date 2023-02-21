CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpat001_rawsec(
ACTIVO string,
BUKRS string,
PERNR string,
PLANS string,
PLSTX string,
ORGEH string,
ORGTX string,
PERNR_BOSS string,
NOMBRE_BOSS string,
PLANS_BOSS string,
PLSTX_BOSS string,
ORGEH_BOSS string,
ORGTX_BOSS string)
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
  's3://rawsec-koandina-dev/regional/sap/hrpat001/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')