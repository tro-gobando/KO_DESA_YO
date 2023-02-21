CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt710st_stagesec(
SPRSL STRING,
SCODE STRING,
JCODE STRING,
LTEXT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt710st'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')