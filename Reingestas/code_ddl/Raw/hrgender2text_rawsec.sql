CREATE EXTERNAL TABLE db_koandina_regional_raw.hrgender2text_rawsec(
LANGU string,
KEY1 string,
TXTLG string)
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
  's3://rawsec-koandina-prod/regional/sap/hrgender2text'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')