CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt1002_analyticssec(
    TABNR string,
    TABSEQNR string,
    TLINE string,
    TFORMAT string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrt1002/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')