CREATE EXTERNAL TABLE db_koandina_regional_raw.hrv1002a_rawsec(
  PLVAR    STRING,
  OTYPE    STRING,
  OBJID    STRING,
  SUBTY    STRING,
  ISTAT    STRING,
  BEGDA    STRING,
  ENDDA    STRING,
  LANGU    STRING,
  FILLER   STRING,
  SEQNR    STRING,
  TABSEQNR STRING,
  OTJID    STRING,
  TFORMAT  STRING,
  TLINE    STRING,
  HISTO    STRING
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
  's3://rawsec-koandina-dev/regional/sap/hrv1002a'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')