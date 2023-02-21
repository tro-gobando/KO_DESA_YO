CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt529t_analyticssec(
SPRSL STRING,
MASSN STRING,
MNTXT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrt529t'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')