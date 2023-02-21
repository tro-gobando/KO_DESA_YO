CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt7cl23t_stagesec(
SPRAS STRING,
IDGPO STRING,
TXGPO STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt7cl23t'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')