CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpa2011_analyticssec(

)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrpa2011'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')