CREATE EXTERNAL TABLE db_koandina_cl_stage.hrt024_stagesec(
trfar string,
stell string,
rotacion string,
rol string,
comentario string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/cl/sap/hrt024'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')