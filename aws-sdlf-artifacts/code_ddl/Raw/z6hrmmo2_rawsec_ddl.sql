CREATE EXTERNAL TABLE db_koandina_cl_raw.z6hrmmo2_rawsec(
pabrj string,
pabrp string,
bukrs string,
pernr string,
kostl string,
begda string,
endda string,
ausen string,
horas string,
dias string,
rotac string,
rol string)
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
's3://rawsec-koandina-$ENV/cl/sap/z6hrmmo2'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1644362860')