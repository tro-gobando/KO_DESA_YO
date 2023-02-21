CREATE EXTERNAL TABLE IF NOT EXISTS db_koandina_regional_stage.z6hrmmo4_stage(
bukrs string,
pernr string,
pabrp string,
pabrj string,
begda string,
turnocod string,
turnotxt string,
hhee string,
kostl string,
ktext string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://stage-koandina-dev/regional/sap/z6hrmmo4/'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')