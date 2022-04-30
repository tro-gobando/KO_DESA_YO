CREATE EXTERNAL TABLE db_koandina_regional_raw.hrp1001_rawsec(
otype string,
objid string,
plvar string,
rsign string,
relat string,
istat string,
priox string,
begda string,
endda string,
varyf string,
seqnr string,
infty string,
otjid string,
subty string,
aedtm string,
uname string,
reasn string,
histo string,
itxnr string,
sclas string,
sobid string,
prozt string,
adatanr string)
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
  's3://rawsec-koandina-prod/regional/sap/hrp1001'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')