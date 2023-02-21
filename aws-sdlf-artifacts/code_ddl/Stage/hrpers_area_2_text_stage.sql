CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpers_area_2_text_stage(
PERSA string,
TXTMD string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/hrpers_area_2_text/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')