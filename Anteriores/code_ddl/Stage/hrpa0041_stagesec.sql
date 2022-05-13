CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0041_stagesec(
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
  dar01 string,
  dat01 string,
  dar02 string,
  dat02 string,
  dar03 string,
  dat03 string,
  dar04 string,
  dat04 string,
  dar05 string,
  dat05 string,
  dar06 string,
  dat06 string,
  dar07 string,
  dat07 string,
  dar08 string,
  dat08 string,
  dar09 string,
  dat09 string,
  dar10 string,
  dat10 string,
  dar11 string,
  dat11 string,
  dar12 string,
  dat12 string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0041'
TBLPROPERTIES (
'compressionType'='SNAPPY')