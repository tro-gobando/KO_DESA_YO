CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.hrmo09_analyticssec(
PABRJ string,
PABRP string,
BUKRS string,
PERNR string,
PLANS string,
COMPARATIO string,
GRADO_HAY string,
GRADO_LIDERAZGO string,
JEFATURA string,
NOMBRE_JEFE string,
ZONA string,
CARGAS_LEGALES string,
CARGA_MENOR2 string,
PROMOCIONES string,
MOV_LATERAL string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/cl/sap/hrmo09'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')