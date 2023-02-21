CREATE EXTERNAL TABLE db_koandina_py_analyticssec.thrrolrt_analyticssec(
    persk    string,
    cttyp    string,
    jcode    string,
    rol      string,
    rotacion string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/py/sap/thrrolrt'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')