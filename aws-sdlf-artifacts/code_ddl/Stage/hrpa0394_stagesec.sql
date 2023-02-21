CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0394_stagesec(
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
  asfax string,
  discp string,
  traba string,
  estud string,
  feinf string,
  nadoc string,
  famst string,
  adhos string,
  clase string,
  ccuil string,
  ictyp string,
  icnum string,
  tipoe string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrpa0394'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')