CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0016_rawsec(
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
  nbtgk string,
  wttkl string,
  lfzfr string,
  lfzzh string,
  lfzso string,
  kgzfr string,
  kgzzh string,
  prbzt string,
  prbeh string,
  kdgfr string,
  kdgf2 string,
  arber string,
  eindt string,
  kondt string,
  konsl string,
  cttyp string,
  ctedt string,
  persg string,
  persk string,
  wrkpl string,
  ctbeg string,
  ctnum string,
  objnb string,
  zzmemo_ing string,
  zzmemo_egr string,
  zind string,
  zinsal string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'quoteChar'='\"',
  'separatorChar'='\;')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://rawsec-koandina-prod/regional/sap/hrpa0016'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')