CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpers_sarea_2_text_stage(
WERKS string,
BTRTL string,
TXTSH string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-prod/regional/sap/hrpers_sarea_2_text/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')