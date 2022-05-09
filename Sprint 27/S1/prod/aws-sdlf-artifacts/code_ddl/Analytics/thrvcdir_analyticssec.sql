CREATE EXTERNAL TABLE db_koandina_br_analyticssec.thrvcdir_analyticssec(
    KOSTL string,
    ENDDA string,
    BEGDA string,
    DSDIR string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/br/sap/thrvcdir/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')