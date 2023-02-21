CREATE EXTERNAL TABLE db_koandina_regional_stage.hr_rel_cargos_stagesec(
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
  's3://stagesec-koandina-prod/regional/externa/hr_rel_cargos'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')