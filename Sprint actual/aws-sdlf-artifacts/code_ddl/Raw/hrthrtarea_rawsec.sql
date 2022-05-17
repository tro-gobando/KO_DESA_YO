CREATE EXTERNAL TABLE db_koandina_br_raw.hrthrtarea_rawsec(
WERKS string,
BTRTL string,
ENDDA string,
BEGDA string,
UNIFIED_SUBAREA string,
REGION string
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
  's3://rawsec-koandina-prod/br/sap/hrthrtarea'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')