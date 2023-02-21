CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hremplgrouptext_analyticssec(
SPRSL string,
PERSG string,
TXTSH string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-prod/regional/sap/hremplgrouptext/'
TBLPROPERTIES ('compressionType'='SNAPPY');