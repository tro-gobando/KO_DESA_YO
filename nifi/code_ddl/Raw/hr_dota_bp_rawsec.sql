CREATE EXTERNAL TABLE db_koandina_regional_raw.hr_dota_bp_rawsec(
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
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ( 
  'quoteChar'='\"', 
  'separatorChar'='\;') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://rawsec-koandina-prod/regional/externa/hr_dota_bp'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')