CREATE EXTERNAL TABLE db_koandina_cl_stage.hrpa9852_stage(

)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-dev/cl/sap/hrpa9852'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')