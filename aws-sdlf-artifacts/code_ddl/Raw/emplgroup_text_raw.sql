CREATE TABLE db_koandina_regional_raw.emplgroup_text_raw(
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
's3://raw-koandina-$ENV/regional/sap/emplgroup_text'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1642004173')