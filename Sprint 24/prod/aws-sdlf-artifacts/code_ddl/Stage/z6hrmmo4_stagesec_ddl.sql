CREATE EXTERNAL TABLE db_koandina_cl_stage.z6hrmmo4_stagesec(
bukrs string,
pernr string,
pabrp string,
pabrj string,
begda string,
turnocod string,
turnotxt string,
hhee string,
kostl string,
ktext string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://stagesec-koandina-$ENV/cl/sap/z6hrmmo4'
TBLPROPERTIES (
'numFiles'='0',
'totalSize'='0',
'transient_lastDdlTime'='1646426927')