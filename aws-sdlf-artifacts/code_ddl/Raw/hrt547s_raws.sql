CREATE EXTERNAL TABLE db_koandina_regional_raw.hrt547s_raw(
SPRSL string,
CTTYP string,
CTTXT string)
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
  's3://raw-koandina-dev/regional/sap/hrt547s/'
TBLPROPERTIES (
  'skip.header.line.count'='1')