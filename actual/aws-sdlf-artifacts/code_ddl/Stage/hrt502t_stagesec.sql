CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt502t_stagesec(
FAMST STRING,
FTEXT STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrt502t'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')