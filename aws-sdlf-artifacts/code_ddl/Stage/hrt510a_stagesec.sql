CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt510a_stagesec(
MOLGA STRING,
TRFAR STRING,
TARTX STRING,
ITRFA STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt510a'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')