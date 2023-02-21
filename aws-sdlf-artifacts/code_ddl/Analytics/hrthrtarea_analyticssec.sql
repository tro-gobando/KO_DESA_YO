CREATE EXTERNAL TABLE db_koandina_br_analyticssec.hrthrtarea_analyticssec(
WERKS string,
BTRTL string,
ENDDA string,
BEGDA string,
UNIFIED_SUBAREA string,
REGION string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/br/sap/hrthrtarea'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')