CREATE EXTERNAL TABLE db_koandina_cl_raw.z6hrmmo4_rawsec(
bukrs string,
pernr string,
pabrp string,
pabrj string,
begda string,
turnocod string,
turnotxt string,
hhee string,
kostl string,
ktext string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://rawsec-koandina-$ENV/cl/sap/z6hrmmo4'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1646166879')