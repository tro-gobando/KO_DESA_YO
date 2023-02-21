CREATE EXTERNAL TABLE db_koandina_regional_analytics.hrt547s_analytics(
SPRSL string,
CTTYP string,
CTTXT string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analytics-koandina-dev/regional/sap/hrt547s/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')