CREATE TABLE db_koandina_regional_raw.emplsgroup_text_raw(
sprsl string,
persk string,
txtsh string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://raw-koandina-$ENV/regional/sap/emplsgroup_text'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1642004173')