CREATE EXTERNAL TABLE IF NOT EXISTS db_koandina_cl_stage.z6hrmmohe_stagesec(
PERNR string,
FECHA string,
TIPODIA string,
STATUS string,
CTD_HE string,
CTD_HE_APR string,
CTD_HE_REC string,
CTD_HE_REZ string,
CTD_HE_PLA string,
TIPO_HE string,
TIPO_HE2 string,
USER_HE string,
DATS_HE string,
TIME_HE string,
USER_HE_REZ string,
DATS_HE_REZ string,
TIME_HE_REZ string,
CL_T_HE_REZ string,
KOSTL string,
MARCAX string,
TURNO string,
ENTRA_PLAN string,
SALE_PLAN string,
ENTRA_REAL string,
SALE_REAL string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://stagesec-koandina-$ENV/cl/sap/z6hrmmohe/'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')