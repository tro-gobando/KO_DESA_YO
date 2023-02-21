CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpayrlarea2text_stage(
LANGU string,
ABKRS string,
TXTSH string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/hrpayrlarea2text'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')