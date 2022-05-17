CREATE EXTERNAL TABLE db_koandina_regional_raw.job_2_text_raw(
  langu string, 
  key1 string, 
  dateto string, 
  datefrom string, 
  txtsh string, 
  txtmd string)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\;' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://raw-koandina-prod/regional/sap/job_text'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'transient_lastDdlTime'='1645560765')