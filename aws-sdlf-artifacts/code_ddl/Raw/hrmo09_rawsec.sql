CREATE EXTERNAL TABLE db_koandina_cl_raw.hrmo09_rawsec(
PABRJ string,
PABRP string,
BUKRS string,
PERNR string,
PLANS string,
COMPARATIO string,
GRADO_HAY string,
GRADO_LIDERAZGO string,
JEFATURA string,
NOMBRE_JEFE string,
ZONA string,
CARGAS_LEGALES string,
CARGA_MENOR2 string,
PROMOCIONES string,
MOV_LATERAL string)
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
  's3://rawsec-koandina-prod/cl/sap/hrmo09'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')