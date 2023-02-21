CREATE EXTERNAL TABLE db_koandina_br_stage.hrthrtarea_stagesec(
WERKS string,
BTRTL string,
ENDDA string,
BEGDA string,
UNIFIED_SUBAREA string,
REGION string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/br/sap/hrthrtarea'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')