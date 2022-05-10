CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0465_rawsec(
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
  tpdoc string,
  dt_emis string,
  es_emis string,
  cpf_nr string,
  ident_nr string,
  ident_org string,
  ctps_nr string,
  ctps_serie string,
  creg_nr string,
  creg_name string,
  creg_init string,
  elec_nr string,
  elec_zone string,
  elec_sect string,
  pis_nr string,
  mil_nr string,
  mil_type string,
  mil_cat string,
  idfor_nr string,
  visa_nr string,
  visa_type string,
  marry_br string,
  dt_arrv string,
  drive_nr string,
  drive_cat string,
  passp_nr string,
  nit_nr string,
  carto string,
  cdeat string,
  death string,
  caude string,
  childbr string,
  doc_issuer string,
  doc_nr string,
  foreign_sit string)
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
  's3://rawsec-koandina-prod/regional/sap/hrpa0465'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')