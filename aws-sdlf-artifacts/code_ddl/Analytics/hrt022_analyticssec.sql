CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.hrt022_analyticssec(
  P2000 string,
  BEGDA string,
  IT0050 string,
  OBSERVA string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/cl/sap/hrt022/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')