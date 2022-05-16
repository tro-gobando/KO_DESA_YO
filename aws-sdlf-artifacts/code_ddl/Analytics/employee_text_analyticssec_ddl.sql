CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.employee_text_analyticssec (
datefrom string,
dateto string,
pernr string,
txtmd string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-$ENV/regional/sap/employee_textsec/'
TBLPROPERTIES ('compressionType'='SNAPPY');