CREATE TABLE db_koandina_regional_stage.hrp1051_stagesec(
MANDT string,
PLVAR string,
OTYPE string,
OBJID string,
SUBTY string,
ISTAT string,
BEGDA string,
ENDDA string,
VARYF string,
SEQNR string,
INFTY string,
OTJID string,
AEDTM string,
UNAME string,
REASN string,
HISTO string,
ITXNR string,
JCODE string,
MABAS string,
MABAM string,
MABPC string,
WAERS string,
PERIO string)
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
  's3://stagesec-koandina-prod/regional/sap/hrp1051/'
