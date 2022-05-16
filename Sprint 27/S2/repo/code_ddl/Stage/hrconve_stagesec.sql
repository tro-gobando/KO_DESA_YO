CREATE EXTERNAL TABLE db_koandina_cl_stage.hrconve_stagesec(
  FIELD string,
  CONDI string,
  ORIGE string,
  DESTI string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/cl/sap/hrconve/'
TBLPROPERTIES (
'compressionType'='SNAPPY')