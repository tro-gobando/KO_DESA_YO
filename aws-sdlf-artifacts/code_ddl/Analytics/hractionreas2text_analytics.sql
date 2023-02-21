CREATE EXTERNAL TABLE db_koandina_regional_analytics.hractionreas2text_analytics(
LANGU string,
MASSN string,
MASSG string,
TXTMD string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analytics-koandina-dev/regional/sap/hractionreas2text'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')