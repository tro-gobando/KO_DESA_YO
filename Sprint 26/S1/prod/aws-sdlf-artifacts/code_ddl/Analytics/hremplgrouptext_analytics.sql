CREATE EXTERNAL TABLE db_koandina_regional_analytics.hremplgrouptext_analytics(
  sprsl string,
  persg string,
  txtsh string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analytics-koandina-prod/regional/sap/hremplgrouptext'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')