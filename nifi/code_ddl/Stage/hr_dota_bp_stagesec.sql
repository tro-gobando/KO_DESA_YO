CREATE EXTERNAL TABLE db_koandina_regional_stage.hr_dota_bp_stagesec(
anio        string,
pais        string,
ceco_dot    string,
cargo       string,
enero       string,
febrero     string,
marzo       string,
abril       string,
mayo        string,
junio       string,
julio       string,
agosto      string,
septiembre  string,
octubre     string,
noviembre   string,
diciembre   string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/externa/hr_dota_bp'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')