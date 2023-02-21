CREATE EXTERNAL TABLE db_koandina_regional_stage.job_2_text_stage(
  langu string, 
  key1 string, 
  dateto string, 
  datefrom string, 
  txtsh string, 
  txtmd string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/job_text'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')