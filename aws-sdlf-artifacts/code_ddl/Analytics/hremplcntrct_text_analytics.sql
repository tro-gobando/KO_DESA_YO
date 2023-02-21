CREATE EXTERNAL TABLE db_koandina_regional_analytics.hremplcntrct_text_analytics(
  spras string, 
  molga string, 
  ansvh string, 
  atx string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analytics-koandina-dev/regional/sap/hremplcntrct_text/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')