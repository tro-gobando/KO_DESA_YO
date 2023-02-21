CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrperssarea2text_analyticssec(
WERKS STRING
,BTRTL STRING
,TXTSH STRING)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrperssarea2text'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')