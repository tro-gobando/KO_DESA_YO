CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt510g_analyticssec(
MOLGA STRING,
TRFGB STRING,
TGBTX STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrt510g'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')