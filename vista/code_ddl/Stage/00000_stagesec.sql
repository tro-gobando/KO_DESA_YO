CREATE EXTERNAL TABLE db_koandina_regional_stage.mtr_dota_stagesec(

)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/mtr_dota'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')