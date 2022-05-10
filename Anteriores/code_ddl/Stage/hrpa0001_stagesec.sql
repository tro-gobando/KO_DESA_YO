CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0001_stagesec(
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
  bukrs string,
  werks string,
  persg string,
  persk string,
  vdsk1 string,
  gsber string,
  btrtl string,
  juper string,
  abkrs string,
  ansvh string,
  kostl string,
  orgeh string,
  plans string,
  stell string,
  mstbr string,
  sacha string,
  sachp string,
  sachz string,
  sname string,
  ename string,
  otype string,
  sbmod string,
  kokrs string,
  fistl string,
  geber string,
  fkber string,
  grant_nbr string,
  sgmnt string,
  budget_pd string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0001'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')