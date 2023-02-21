CREATE EXTERNAL TABLE db_koandina_regional_stage.hrp1008_stagesec(
PLVAR string,
OTYPE string,
OBJID string,
SUBTY string,
ISTAT string,
BEGDA string,
ENDDA string,
VARYF string,
SEQNR string,
INFTY string,
OTJID string,
AEDTM string,
UNAME string,
REASN string,
HISTO string,
ITXNR string,
BUKRS string,
GSBER string,
WERKS string,
PERSA string,
BTRTL string,
KOKRS string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrp1008'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')