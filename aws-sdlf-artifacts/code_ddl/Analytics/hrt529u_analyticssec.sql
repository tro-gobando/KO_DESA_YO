CREATE TABLE db_koandina_regional_analyticssec.hrt529u_analyticssec(
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
  's3://analyticssec-koandina-prod/regional/sap/hrt529u/'
