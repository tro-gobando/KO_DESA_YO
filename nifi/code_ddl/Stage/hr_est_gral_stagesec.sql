CREATE EXTERNAL TABLE db_koandina_regional_stage.hr_est_gral_stagesec(
anio                    string,
mes                     string,
operacion               string,
operacion_original      string,
nro_personal            string,
nombre                  string,
ceco                    string,
ceco_descripcion        string,
nivel_1                 string,
nivel_2                 string,
nivel_3                 string,
unidorg                 string,
unidorg_descripcion     string,
cod_cargo               string,
desc_cargo              string,
cod_posicion            string,
desc_posicion           string,
dir                     string,
gestion                 string,
subgestion              string,
cargo_vendedor          string,
sectores                string,
areas                   string,
area_kpi                string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/externa/hr_est_gral'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')