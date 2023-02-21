CREATE EXTERNAL TABLE db_koandina_regional_stage.hrlsotformtc_stagesec(
TFORM string,
SPRAS string,
TXTSHORT string,
TXTSING string,
TXTPLUR string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrlsotformtc'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')