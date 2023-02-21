CREATE EXTERNAL TABLE db_koandina_regional_analytics.emplgroup_text_analytics (
SPRSL string,
PERSG string,
TXTSH string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analytics-koandina-$ENV/regional/sap/emplgroup_text/'
TBLPROPERTIES ('compressionType'='SNAPPY');