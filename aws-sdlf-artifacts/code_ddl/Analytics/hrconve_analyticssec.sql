CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.hrconve_analyticssec(
  FIELD string,
  CONDI string,
  ORIGE string,
  DESTI string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/cl/sap/hrconve/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')