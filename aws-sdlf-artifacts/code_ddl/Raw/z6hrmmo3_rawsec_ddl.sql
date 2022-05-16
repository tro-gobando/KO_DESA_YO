CREATE EXTERNAL TABLE db_koandina_cl_raw.z6hrmmo3_rawsec(
bukrs string,
pabrj string,
pabrp string,
kostl string,
pernr string,
begda string,
endda string,
diasv string,
saldo string,
rotac string,
rol string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://rawsec-koandina-$ENV/cl/sap/z6hrmmo3'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1646167756')