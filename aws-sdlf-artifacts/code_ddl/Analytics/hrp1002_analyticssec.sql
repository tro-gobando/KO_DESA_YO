CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrp1002_analyticssec(
  PLVAR string,
  OTYPE string,
  OBJID string,
  SUBTY string,
  ISTAT string,
  BEGDA string,
  ENDDA string,
  LANGU string,
  FILLER string,
  SEQNR string,
  INFTY string,
  OTJID string,
  AEDTM string,
  UNAME string,
  REASN string,
  HISTO string,
  ITXNR string,
  TABNR string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrp1002/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')