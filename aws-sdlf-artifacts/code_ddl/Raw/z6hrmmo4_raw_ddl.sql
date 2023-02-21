CREATE TABLE db_koandina_regional_raw.z6hrmmo4_raw(
bukrs string,
pernr string,
pabrp string,
pabrj string,
begda string,
turnocod string,
turnotxt string,
hhee string,
kostl string,
ktext string
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://raw-koandina-dev/regional/sap/z6hrmmo4/'
TBLPROPERTIES (
  'skip.header.line.count'='1');