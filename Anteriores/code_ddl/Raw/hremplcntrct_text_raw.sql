CREATE TABLE db_koandina_regional_raw.hremplcntrct_text_raw(
  spras string, 
  molga string, 
  ansvh string, 
  atx string)
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
  's3://raw-koandina-prod/regional/sap/hremplcntrct_text/'
TBLPROPERTIES (
  'skip.header.line.count'='1')