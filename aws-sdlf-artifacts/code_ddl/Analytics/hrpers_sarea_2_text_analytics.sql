CREATE TABLE db_koandina_regional_analytics.hrpers_sarea_2_text_analytics(
WERKS string,
BTRTL string,
TXTSH string)
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
  's3://analytics-koandina-prod/regional/sap/hrpers_sarea_2_text/'