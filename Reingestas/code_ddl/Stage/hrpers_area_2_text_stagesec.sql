CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpers_area_2_text_stagesec(
PERSA string,
TXTMD string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpers_area_2_text/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')