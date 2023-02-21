CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hremplcntrct_text_analyticssec(
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
  's3://analyticssec-koandina-prod/regional/sap/hremplcntrct_text/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')