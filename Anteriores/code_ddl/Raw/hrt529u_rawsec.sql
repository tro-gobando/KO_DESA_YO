CREATE EXTERNAL TABLE db_koandina_regional_raw.hrt529u_rawsec(
SPRSL string,
STATN string,
STATV string,
TEXT1 string)
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
  's3://rawsec-koandina-prod/regional/sap/hrt529u/'
TBLPROPERTIES (
  'skip.header.line.count'='1')