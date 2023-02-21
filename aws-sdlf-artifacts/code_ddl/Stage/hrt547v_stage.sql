CREATE EXTERNAL TABLE db_koandina_regional_stage.hrt547v_stage(
CTTYP string,
CTLTD string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/regional/sap/hrt547v/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')