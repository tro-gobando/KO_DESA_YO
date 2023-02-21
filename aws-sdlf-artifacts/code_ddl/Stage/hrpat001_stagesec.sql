CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpat001_stagesec(
ACTIVO string,
BUKRS string,
PERNR string,
PLANS string,
PLSTX string,
ORGEH string,
ORGTX string,
PERNR_BOSS string,
NOMBRE_BOSS string,
PLANS_BOSS string,
PLSTX_BOSS string,
ORGEH_BOSS string,
ORGTX_BOSS string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrpat001'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')