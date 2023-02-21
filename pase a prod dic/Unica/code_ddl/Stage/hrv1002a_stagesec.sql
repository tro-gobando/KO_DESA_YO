CREATE EXTERNAL TABLE db_koandina_regional_stage.hrv1002a_stagesec(
  PLVAR    STRING,
  OTYPE    STRING,
  OBJID    STRING,
  SUBTY    STRING,
  ISTAT    STRING,
  BEGDA    STRING,
  ENDDA    STRING,
  LANGU    STRING,
  FILLER   STRING,
  SEQNR    STRING,
  TABSEQNR STRING,
  OTJID    STRING,
  TFORMAT  STRING,
  TLINE    STRING,
  HISTO    STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrv1002a'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')