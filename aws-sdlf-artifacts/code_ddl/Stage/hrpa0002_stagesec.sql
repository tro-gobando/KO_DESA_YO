CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0002_stagesec(
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
  inits string,
  nachn string,
  name2 string,
  nach2 string,
  vorna string,
  cname string,
  titel string,
  titl2 string,
  namzu string,
  vorsw string,
  vors2 string,
  rufnm string,
  midnm string,
  knznm string,
  anred string,
  gesch string,
  gbdat string,
  gblnd string,
  gbdep string,
  gbort string,
  natio string,
  nati2 string,
  nati3 string,
  sprsl string,
  konfe string,
  famst string,
  famdt string,
  anzkd string,
  nacon string,
  permo string,
  perid string,
  gbpas string,
  fnamk string,
  lnamk string,
  fnamr string,
  lnamr string,
  nabik string,
  nabir string,
  nickk string,
  nickr string,
  gbjhr string,
  gbmon string,
  gbtag string,
  nchmc string,
  vnamc string,
  namz2 string,
  zz_ampl string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrpa0002'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')