CREATE EXTERNAL TABLE db_koandina_py_raw.thrrolrt_rawsec(
    persk    string,
    cttyp    string,
    jcode    string,
    rol      string,
    rotacion string)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\;' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://rawsec-koandina-prod/py/sap/thrrolrt'
TBLPROPERTIES (
  'skip.header.line.count'='1')