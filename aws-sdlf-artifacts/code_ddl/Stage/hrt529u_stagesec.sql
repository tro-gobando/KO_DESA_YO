CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt529u_stagesec(
SPRSL string,
STATN string,
STATV string,
TEXT1 string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrt529u/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')
