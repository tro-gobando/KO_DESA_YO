CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrt529a_analyticssec(
MASSN STRING,
ITYGR STRING,
WERKS STRING,
PERSG STRING,
PERSK STRING,
FSTAT STRING,
FUNCH STRING,
STAT1 STRING,
STAT2 STRING,
STAT3 STRING,
AUSDT STRING,
NAMEN STRING,
P0000 STRING,
P0302 STRING,
ORDNR STRING,
CTRY_CHG STRING,
MULTI_PERAS STRING,
SHOW_PT50 STRING,
BEN_WB STRING,
CHG_LEGAL STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrt529a'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')