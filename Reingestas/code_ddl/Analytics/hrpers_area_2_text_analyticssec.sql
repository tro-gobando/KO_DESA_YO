CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpers_area_2_text_analyticssec(
PERSA string,
TXTMD string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrpers_area_2_text/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')