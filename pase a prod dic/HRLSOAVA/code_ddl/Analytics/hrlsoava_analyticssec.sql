CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrlsoava_analyticssec(
OBJID string,
PERNR string,
ZNOTA string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrlsoava'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')