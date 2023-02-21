CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrv1002a_analyticssec(
  PLVAR    STRING,
  OTYPE    STRING,
  OBJID    STRING,
  SUBTY    STRING,
  ISTAT    STRING,
  BEGDA    STRING,
  ENDDA    STRING,
  LANGU    STRING,
  FILLER   STRING,
  SEQNR    STRING,
  TABSEQNR STRING,
  OTJID    STRING,
  TFORMAT  STRING,
  TLINE    STRING,
  HISTO    STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrv1002a'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')