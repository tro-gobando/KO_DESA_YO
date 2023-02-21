CREATE EXTERNAL TABLE db_koandina_regional_raw.hrp1042_rawsec(
plvar string,
otype string,
objid string,
subty string,
istat string,
begda string,
endda string,
varyf string,
seqnr string,
infty string,
otjid string,
aedtm string,
uname string,
reasn string,
histo string,
itxnr string,
aclas string,
amust string,
refak string,
bgday string,
rday1 string,
rday2 string,
rday3 string,
rday4 string,
rdayl string,
refrq string,
ndays string,
nhours string,
tabnr string
)
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
  's3://rawsec-koandina-prod/regional/sap/hrp1042'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')