CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt005t_analyticssec(
SPRAS STRING,
LAND1 STRING,
LANDX STRING,
NATIO STRING,
LANDX50 STRING,
NATIO50 STRING,
PRQ_SPREGT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrt005t'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')