CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpa0004_analyticssec(
  mandt string,
  pernr string,
  subty string,
  objps string,
  sprps string,
  endda string,
  begda string,
  seqnr string,
  aedtm string,
  uname string,
  histo string,
  itxex string,
  refex string,
  ordex string,
  itbld string,
  preas string,
  flag1 string,
  flag2 string,
  flag3 string,
  flag4 string,
  rese1 string,
  rese2 string,
  grpvl string,
  sbgru string,
  sbpro string,
  sbart string,
  sbfak string,
  sbdst string,
  sbgsz string,
  sbadt string,
  sbds2 string,
  sbgs2 string,
  sbad2 string,
  sbaud string,
  sbprf string,
  wegdt string,
  dnstl string,
  dsitz string,
  nachw string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrpa0004'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')