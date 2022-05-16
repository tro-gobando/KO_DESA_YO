CREATE TABLE db_koandina_regional_analytics.hrposition_text_analytics(
LANGU string,
KEY1 string,
DATETO string,
DATEFROM string,
TXTSH string,
TXTMD string)
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
  's3://analytics-koandina-prod/regional/sap/hrposition_text/'