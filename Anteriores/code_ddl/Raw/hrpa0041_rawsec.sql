CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0041_rawsec(
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
  'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  'quoteChar'='\"',
  'separatorChar'='\;')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://rawsec-koandina-prod/regional/sap/hrpa0041'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')