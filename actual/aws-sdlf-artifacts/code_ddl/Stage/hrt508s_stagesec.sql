CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt508s_stagesec(
ZEITY STRING,
MOFID STRING,
MOSID STRING,
SCHKZ STRING,
SPRSL STRING,
RTEXT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrt508s'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')