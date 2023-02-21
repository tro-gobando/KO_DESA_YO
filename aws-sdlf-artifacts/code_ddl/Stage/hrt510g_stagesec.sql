CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt510g_stagesec(
MOLGA STRING,
TRFGB STRING,
TGBTX STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt510g'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')