CREATE EXTERNAL TABLE db_koandina_regional_stage.hremplsgrouptext_stage(
  sprsl string,
  persk string,
  txtsh string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-prod/regional/sap/hremplsgrouptext'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')