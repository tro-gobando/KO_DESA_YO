CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt1002_stagesec(
    TABNR string,
    TABSEQNR string,
    TLINE string,
    TFORMAT string)
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
  's3://stagesec-koandina-dev/regional/sap/hrt1002/'
TBLPROPERTIES (
'compressionType'='SNAPPY')