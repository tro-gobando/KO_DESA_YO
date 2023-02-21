CREATE EXTERNAL TABLE db_koandina_regional_raw.hrt529a_rawsec(
MASSN STRING,
ITYGR STRING,
WERKS STRING,
PERSG STRING,
PERSK STRING,
FSTAT STRING,
FUNCH STRING,
STAT1 STRING,
STAT2 STRING,
STAT3 STRING,
AUSDT STRING,
NAMEN STRING,
P0000 STRING,
P0302 STRING,
ORDNR STRING,
CTRY_CHG STRING,
MULTI_PERAS STRING,
SHOW_PT50 STRING,
BEN_WB STRING,
CHG_LEGAL STRING
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
  's3://rawsec-koandina-dev/regional/sap/hrt529a'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')