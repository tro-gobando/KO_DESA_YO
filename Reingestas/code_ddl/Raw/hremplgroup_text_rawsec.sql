CREATE EXTERNAL TABLE db_koandina_regional_raw.hremplgrouptext_rawsec(
SPRSL string,
PERSG string,
TXTSH string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://rawsec-koandina-prod/regional/sap/hremplgrouptext'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1642004173')