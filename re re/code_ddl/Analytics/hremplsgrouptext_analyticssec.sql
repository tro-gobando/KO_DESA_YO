CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hremplsgrouptext_analyticssec(
sprsl string,
persk string,
txtsh string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hremplsgrouptext'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')