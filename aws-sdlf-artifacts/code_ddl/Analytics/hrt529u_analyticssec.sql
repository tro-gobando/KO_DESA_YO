CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt529u_analyticssec(
SPRSL string,
STATN string,
STATV string,
TEXT1 string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrt529u/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')
