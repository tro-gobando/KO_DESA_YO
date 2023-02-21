CREATE EXTERNAL TABLE db_koandina_regional_analytics.employee_text_analytics (
  datefrom string,
  dateto string,
  pernr string,
  txtmd string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analytics-koandina-dev/regional/sap/employee_text/'
TBLPROPERTIES ('compressionType'='SNAPPY');