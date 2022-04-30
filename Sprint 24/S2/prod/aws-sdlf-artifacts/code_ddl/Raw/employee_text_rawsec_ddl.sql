CREATE EXTERNAL TABLE db_koandina_regional_raw.employee_text_rawsec(
datefrom string,
dateto string,
pernr string,
txtmd string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://rawsec-koandina-$ENV/regional/sap/employee_textsec'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1641324352')