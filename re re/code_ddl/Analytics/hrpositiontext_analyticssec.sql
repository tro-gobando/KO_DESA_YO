CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpositiontext_analyticssec(
LANGU string,
KEY1 string,
DATETO string,
DATEFROM string,
TXTSH string,
TXTMD string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrpositiontext'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')