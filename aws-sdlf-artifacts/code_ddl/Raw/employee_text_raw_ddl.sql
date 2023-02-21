CREATE EXTERNAL TABLE employee_text_raw(
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
  's3://raw-koandina-dev/regional/sap/employee_text'
TBLPROPERTIES (
  'skip.header.line.count'='1',
  'transient_lastDdlTime'='1641324352')