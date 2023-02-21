CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.hrpa9852_analyticssec(

)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/cl/sap/hrpa9852'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')