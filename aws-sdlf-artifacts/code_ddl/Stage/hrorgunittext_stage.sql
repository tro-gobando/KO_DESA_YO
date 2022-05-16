CREATE EXTERNAL TABLE db_koandina_regional_stage.hrorgunittext_stage(
LANGU string,
KEY1 string,
DATETO string,
DATEFROM string,
TXTSH string,
TXTMD string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stage-koandina-prod/regional/sap/hrorgunittext'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')