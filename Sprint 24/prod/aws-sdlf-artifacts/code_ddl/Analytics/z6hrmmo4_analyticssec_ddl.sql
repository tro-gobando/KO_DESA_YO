CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.z6hrmmo4_analyticssec(
bukrs string,
pernr string,
pabrp string,
pabrj string,
begda string,
turnocod string,
turnotxt string,
hhee string,
kostl string,
ktext string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://analyticssec-koandina-$ENV/cl/sap/z6hrmmo4'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'transient_lastDdlTime'='1646661874')