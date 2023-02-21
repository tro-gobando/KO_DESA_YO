CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt547v_analyticssec(
CTTYP string,
CTLTD string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrt547v/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')