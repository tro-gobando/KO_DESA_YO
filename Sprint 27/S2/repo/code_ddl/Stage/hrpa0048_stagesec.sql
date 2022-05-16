CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0048_stagesec(
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
  ASTAT string,
  BEWNR string,
  ABLAD string,
  AUSGD string,
  AUSBE string,
  EINRD string,
  PASSN string,
  VISAT string,
  VISAS string,
  RSTUS string,
  PRFID string,
  PPLND string,
  WPFUN string,
  WPEND string,
  VIBEG string,
  REASP string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0048/'
TBLPROPERTIES (
'compressionType'='SNAPPY')