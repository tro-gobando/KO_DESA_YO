CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt547s_stage(
SPRSL string,
CTTYP string,
CTTXT string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/hrt547s/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')