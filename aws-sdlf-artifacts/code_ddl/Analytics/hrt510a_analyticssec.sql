CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt510a_analyticssec(
MOLGA STRING,
TRFAR STRING,
TARTX STRING,
ITRFA STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrt510a'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')