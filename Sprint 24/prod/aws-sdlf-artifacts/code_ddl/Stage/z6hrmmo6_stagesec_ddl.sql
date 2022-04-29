CREATE EXTERNAL TABLE db_koandina_cl_stage.z6hrmmo6_stagesec(
pernr string,
pabrp string,
pabrj string,
begda string,
sysdatum string,
app string,
apm string,
nom string,
stat2 string,
bukrs string,
kostl string,
trfar string,
trfartxt string,
gerencia2 string,
fing string,
plans_txt string,
saldo string)
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
's3://stagesec-koandina-$ENV/cl/sap/z6hrmmo6'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1646426776')