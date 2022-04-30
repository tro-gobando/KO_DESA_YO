CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa2006_stagesec(
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
beguz string,
enduz string,
vtken string,
ktart string,
anzhl string,
kverb string,
quonr string,
desta string,
deend string,
quosy string,
tdlangu string,
tdsubla string,
tdtype string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa2006'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')