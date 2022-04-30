CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpat002_stagesec(
bukrs string,
pernr_boss string,
orgeh_padre string,
orgtx_padre string,
nivel string,
orgeh_hija string,
orgtx_hija string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpat002'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')