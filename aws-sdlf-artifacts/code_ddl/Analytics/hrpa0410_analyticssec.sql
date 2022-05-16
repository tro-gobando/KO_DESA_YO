CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpa0410_analyticssec(
PERNR string,
SUBTY string,
OBJPS string,
SPRPS string,
ENDDA string,
BEGDA string,
SEQNR string,
AEDTM string,
UNAME string,
HISTO string,
ITXEX string,
REFEX string,
ORDEX string,
ITBLD string,
PREAS string,
FLAG1 string,
FLAG2 string,
FLAG3 string,
FLAG4 string,
RESE1 string,
RESE2 string,
GRPVL string,
TRANS string,
TVIAG string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrpa0410'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')