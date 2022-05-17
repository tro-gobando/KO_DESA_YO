CREATE EXTERNAL TABLE db_koandina_cl_stage.hrt044_stagesec(
PERNR STRING,
BEGDA STRING,
COD_UEN STRING,
COD_ZON STRING,
TERRITC STRING,
UNAME STRING,
AEDTM STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/cl/sap/hrt044'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')