CREATE EXTERNAL TABLE db_koandina_cl_raw.hrthrdecin_rawsec(
PERNR STRING,
CNAME STRING,
ICNUM STRING,
USRID_LONG STRING,
PLSTX STRING,
ORGTX STRING,
KOSTL STRING,
KOSTX STRING,
PAIS STRING,
OPERACION STRING,
NOMBRE_BOSS STRING,
ORGTX_BOSS STRING,
PLSTX_BOSS STRING,
USRID_LONG_BOSS STRING
)
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
  's3://rawsec-koandina-dev/cl/sap/hrthrdecin'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')