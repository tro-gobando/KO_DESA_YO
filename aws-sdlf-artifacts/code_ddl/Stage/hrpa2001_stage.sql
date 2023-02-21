CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa2001_stage(
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
awart string,
abwtg string,
stdaz string,
abrtg string,
abrst string,
anrtg string,
lfzed string,
krged string,
kbbeg string,
rmdda string,
kenn1 string,
kenn2 string,
kaltg string,
urman string,
begva string,
bwgrl string,
aufkz string,
trfgr string,
trfst string,
prakn string,
prakz string,
otype string,
plans string,
mldda string,
mlduz string,
rmduz string,
vorgs string,
umskd string,
umsch string,
refnr string,
unfal string,
stkrv string,
stund string,
psarb string,
ainft string,
gener string,
hrsif string,
alldf string,
waers string,
logsys string,
awtyp string,
awref string,
aworg string,
docsy string,
docnr string,
payty string,
payid string,
bondt string,
ocrsn string,
sppe1 string,
sppe2 string,
sppe3 string,
sppin string,
zkmkt string,
faprs string,
tdlangu string,
tdsubla string,
tdtype string,
nxdfl string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/hrpa2001'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')