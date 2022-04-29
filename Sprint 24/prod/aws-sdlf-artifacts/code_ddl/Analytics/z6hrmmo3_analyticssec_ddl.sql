CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.z6hrmmo3_analyticssec
(
BUKRS	string,
PABRJ	string,
PABRP	string,
KOSTL	string,
PERNR	string,
BEGDA	string,
ENDDA	string,
DIASV	string,
SALDO	string,
ROTAC	string,
ROL	string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-$ENV/cl/sap/z6hrmmo3/'
TBLPROPERTIES ('compressionType'='SNAPPY');