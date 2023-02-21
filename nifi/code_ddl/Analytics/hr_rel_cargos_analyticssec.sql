CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hr_rel_cargos_analyticssec(
cargo_bit   string,
cargo_sap   string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/externa/hr_rel_cargos'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')