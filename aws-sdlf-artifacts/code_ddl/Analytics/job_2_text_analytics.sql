CREATE EXTERNAL TABLE db_koandina_regional_analytics.job_2_text_analytics(
  langu string, 
  key1 string, 
  dateto string, 
  datefrom string, 
  txtsh string, 
  txtmd string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analytics-koandina-dev/regional/sap/job_text'
TBLPROPERTIES (
  'transient_lastDdlTime'='1645813227')