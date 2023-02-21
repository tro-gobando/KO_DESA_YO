CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa2011_stagesec(

)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrpa2011'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')