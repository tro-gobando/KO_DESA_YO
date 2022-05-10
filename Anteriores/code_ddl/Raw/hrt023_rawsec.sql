CREATE TABLE db_koandina_cl_raw.hrt023_rawsec(
MANDT string,
KOSTL string,
TRFAR string,
GERENCIA1 string,
GERENCIA2 string,
GERENCIA_OM string,
RG_TIEMPOS string,
ANALISTA string,
COMENTARIO string)
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
  's3://rawsec-koandina-prod/cl/sap/hrt023/'
TBLPROPERTIES (
  'skip.header.line.count'='1')