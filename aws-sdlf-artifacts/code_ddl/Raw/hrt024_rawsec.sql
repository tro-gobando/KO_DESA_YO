CREATE EXTERNAL TABLE db_koandina_cl_raw.hrt024_rawsec(
trfar string,
stell string,
rotacion string,
rol string,
comentario string)
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
  's3://rawsec-koandina-dev/cl/sap/hrt024'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')