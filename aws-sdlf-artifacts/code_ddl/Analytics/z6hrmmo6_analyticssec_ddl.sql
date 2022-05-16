CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.z6hrmmo6_analyticssec
(
PERNR string,
PABRP string,
PABRJ string,
BEGDA string,
SYSDATUM string,
APP string,
APM string,
NOM string,
STAT2 string,
BUKRS string,
KOSTL string,
TRFAR string,
TRFARTXT string,
GERENCIA2 string,
FING string,
PLANS_TXT string,
SALDO string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-$ENV/cl/sap/z6hrmmo6/'
TBLPROPERTIES ('compressionType'='SNAPPY');