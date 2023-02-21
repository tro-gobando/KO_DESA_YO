CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0185_rawsec(
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
  ictyp string,
  icnum string,
  icold string,
  auth1 string,
  docn1 string,
  fpdat string,
  expid string,
  isspl string,
  iscot string,
  idcot string,
  ovchk string,
  astat string,
  akind string,
  rejec string,
  usefr string,
  useto string,
  daten string,
  dateu string,
  times string)
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
  's3://rawsec-koandina-dev/regional/sap/hrpa0185'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')