CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.hrthrdecin_analyticssec(
PERNR STRING,
CNAME STRING,
ICNUM STRING,
USRID_LONG STRING,
PLSTX STRING,
ORGTX STRING,
KOSTL STRING,
KOSTX STRING,
PAIS STRING,
OPERACION STRING,
NOMBRE_BOSS STRING,
ORGTX_BOSS STRING,
PLSTX_BOSS STRING,
USRID_LONG_BOSS STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/cl/sap/hrthrdecin'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')