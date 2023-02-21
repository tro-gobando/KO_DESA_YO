CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrlsotformtc_analyticssec(
TFORM string,
SPRAS string,
TXTSHORT string,
TXTSING string,
TXTPLUR string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrlsotformtc'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')