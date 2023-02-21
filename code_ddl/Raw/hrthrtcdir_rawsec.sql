CREATE EXTERNAL TABLE db_koandina_br_raw.hrthrtcdir_rawsec(
    KOSTL string,
    ENDDA string,
    BEGDA string,
    DSDIR string,
    DIRRE string,
    GESTA string,
    SUBGE string,
    LOCLI string,
    INDIC string)
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
  's3://rawsec-koandina-dev/br/sap/hrthrtcdir/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')