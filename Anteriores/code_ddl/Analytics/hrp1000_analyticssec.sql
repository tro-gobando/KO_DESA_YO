CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrp1000_analyticssec(
MANDT string,
PLVAR string,
OTYPE string,
OBJID string,
ISTAT string,
BEGDA string,
ENDDA string,
LANGU string,
SEQNR string,
OTJID string,
INFTY string,
AEDTM string,
UNAME string,
REASN string,
HISTO string,
ITXNR string,
SHORT string,
STEXT string,
GDATE string,
MC_SHORT string,
MC_STEXT string,
MC_SEARK string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrp1000/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')
