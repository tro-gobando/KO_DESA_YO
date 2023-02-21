CREATE EXTERNAL TABLE db_koandina_regional_stage.hrperssarea2text_stagesec(
WERKS STRING
,BTRTL STRING
,TXTSH STRING)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrperssarea2text'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')