CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hremplsgrouptext_analyticssec(
sprsl string,
persk string,
txtsh string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-prod/regional/sap/hremplsgrouptext/'
TBLPROPERTIES ('compressionType'='SNAPPY');