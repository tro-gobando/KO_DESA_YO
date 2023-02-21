CREATE EXTERNAL TABLE db_koandina_regional_stage.hrp1001_stagesec(
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
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrp1001'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')