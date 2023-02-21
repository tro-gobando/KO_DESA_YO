CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrp1042_analyticssec(
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
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrp1042'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')