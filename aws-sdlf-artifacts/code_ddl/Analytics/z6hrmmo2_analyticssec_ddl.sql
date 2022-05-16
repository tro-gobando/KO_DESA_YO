CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.z6hrmmo2_analyticssec
(
PABRJ string,
PABRP string,
BUKRS string,
PERNR string,
KOSTL string,
BEGDA string,
ENDDA string,
AUSEN string,
HORAS string,
DIAS string,
ROTAC string,
ROL string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-$ENV/cl/sap/z6hrmmo2/'
TBLPROPERTIES ('compressionType'='SNAPPY');