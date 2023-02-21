CREATE EXTERNAL TABLE db_koandina_regional_analytics.emplsgroup_text_analytics (
sprsl string,
persk string,
txtsh string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analytics-koandina-$ENV/regional/sap/emplsgroup_text/'
TBLPROPERTIES ('compressionType'='SNAPPY');