CREATE EXTERNAL TABLE db_koandina_br_stage.hrthrvarea_stagesec(
WERKS string,
BTRTL string,
ENDDA string,
BEGDA string,
UNIFIED_SUBAREA string,
REGION string,
BTEXT string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/br/sap/hrthrvarea'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')