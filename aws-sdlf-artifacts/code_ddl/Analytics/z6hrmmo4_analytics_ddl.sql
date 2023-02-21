CREATE EXTERNAL TABLE db_koandina_regional_analytics.z6hrmmo4_analytics (
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
STORED AS PARQUET
LOCATION 's3://analytics-koandina-dev/regional/sap/z6hrmmo4/'
TBLPROPERTIES ('compressionType'='SNAPPY');