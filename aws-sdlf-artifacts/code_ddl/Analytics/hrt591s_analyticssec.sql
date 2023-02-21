CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt591s_analyticssec(
SPRSL STRING,
INFTY STRING,
SUBTY STRING,
STEXT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrt591s'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')