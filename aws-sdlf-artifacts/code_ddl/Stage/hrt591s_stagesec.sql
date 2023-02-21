CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt591s_stagesec(
SPRSL STRING,
INFTY STRING,
SUBTY STRING,
STEXT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt591s'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')