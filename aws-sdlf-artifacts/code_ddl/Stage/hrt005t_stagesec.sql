CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt005t_stagesec(
SPRAS STRING,
LAND1 STRING,
LANDX STRING,
NATIO STRING,
LANDX50 STRING,
NATIO50 STRING,
PRQ_SPREGT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt005t'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')