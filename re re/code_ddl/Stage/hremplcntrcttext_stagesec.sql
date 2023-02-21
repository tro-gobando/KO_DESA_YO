CREATE EXTERNAL TABLE db_koandina_regional_stage.hremplcntrcttext_stagesec(
  spras string,
  molga string,
  ansvh string,
  atx string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hremplcntrcttext'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')