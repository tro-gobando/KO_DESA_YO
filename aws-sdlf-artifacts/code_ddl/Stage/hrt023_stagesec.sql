CREATE EXTERNAL TABLE db_koandina_cl_stage.hrt023_stagesec(
KOSTL string,
TRFAR string,
GERENCIA1 string,
GERENCIA2 string,
GERENCIA_OM string,
RG_TIEMPOS string,
ANALISTA string,
COMENTARIO string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/cl/sap/hrt023/'
TBLPROPERTIES ( 
  'compressionType'='SNAPPY')
