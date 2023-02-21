CREATE EXTERNAL TABLE db_koandina_regional_stage.hractionreas2text_stage(
LANGU string,
MASSN string,
MASSG string,
TXTMD string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/hractionreas2text'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')