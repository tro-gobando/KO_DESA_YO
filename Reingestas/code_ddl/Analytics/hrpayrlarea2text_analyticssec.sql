CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpayrlarea2text_analyticssec(
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
  's3://analyticssec-koandina-prod/regional/sap/hrpayrlarea2text'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')