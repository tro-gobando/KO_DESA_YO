CREATE EXTERNAL TABLE db_koandina_br_stage.thrvcdir_stagesec(
    KOSTL string,
    ENDDA string,
    BEGDA string,
    DSDIR string)
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
  's3://stagesec-koandina-prod/br/sap/thrvcdir/'
TBLPROPERTIES (
'compressionType'='SNAPPY')