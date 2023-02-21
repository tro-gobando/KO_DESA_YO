CREATE EXTERNAL TABLE mtr_dota_analyticssec(
  anio string, 
  mes string, 
  nro_pers string, 
  nomb_pers string, 
  cod_sociedad string, 
  sociedad string, 
  opeacion string, 
  localidad string, 
  zona string, 
  gerencia_1 string, 
  gerencia_2 string, 
  grado_hay string, 
  rotacion string, 
  rol string, 
  genero string, 
  nacionalidad string, 
  condicion string, 
  fech_ing string, 
  fech_nac string, 
  cargo string, 
  centro_costo string, 
  cen_cost_imp string, 
  idioma string, 
  mail string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/mtr_dota'
TBLPROPERTIES (
  'transient_lastDdlTime'='1654569250')