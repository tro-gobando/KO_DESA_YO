CREATE EXTERNAL TABLE db_koandina_regional_analytics.hrpayrlarea2text_analytics(
LANGU string,
ABKRS string,
TXTSH string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analytics-koandina-dev/regional/sap/hrpayrlarea2text'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')