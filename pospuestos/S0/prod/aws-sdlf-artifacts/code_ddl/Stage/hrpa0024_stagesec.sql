CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0024_stagesec(
PERNR STRING,
SUBTY STRING,
OBJPS STRING,
SPRPS STRING,
ENDDA STRING,
BEGDA STRING,
SEQNR STRING,
AEDTM STRING,
UNAME STRING,
HISTO STRING,
ITXEX STRING,
REFEX STRING,
ORDEX STRING,
ITBLD STRING,
PREAS STRING,
FLAG1 STRING,
FLAG2 STRING,
FLAG3 STRING,
FLAG4 STRING,
RESE1 STRING,
RESE2 STRING,
GRPVL STRING,
QUALI STRING,
AUSPR STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0024'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')