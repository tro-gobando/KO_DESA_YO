CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0007_rawsec(
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
  schkz string,
  zterf string,
  empct string,
  mostd string,
  wostd string,
  arbst string,
  wkwdy string,
  jrstd string,
  teilk string,
  minta string,
  maxta string,
  minwo string,
  maxwo string,
  minmo string,
  maxmo string,
  minja string,
  maxja string,
  dysch string,
  kztim string,
  wweek string,
  awtyp string)
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
  's3://rawsec-koandina-prod/regional/sap/hrpa0007'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')