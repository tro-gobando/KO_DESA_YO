CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hr_est_terceros_analyticssec(
anio        string,
semestre	string,
operacion	string,
nivel_1	    string,
nivel_2	    string,
nivel_3	    string,
valor	    string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/externa/hr_est_terceros'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')