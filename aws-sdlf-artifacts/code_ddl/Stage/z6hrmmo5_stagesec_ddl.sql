CREATE EXTERNAL TABLE db_koandina_cl_stage.z6hrmmo5_stagesec(
pernr string,
pabrp string,
pabrj string,
begda string,
endda string,
rut string,
nombre string,
bukrs string,
mov string,
tipomov string,
werks string,
btrtl string,
kostl string,
kostltxt string,
plans string,
planstxt string,
fechaing string,
fechaegr string,
rotacion string,
gerencia1 string,
gerencia2 string,
cttyp string,
cttxt string,
causal string,
orgeh string,
orgehtxt string,
trfar string,
tartx string,
sexo string,
rol string,
natsl string,
natio string,
comuna string,
gbdat string,
famst string,
fatxt string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://stagesec-koandina-$ENV/cl/sap/z6hrmmo5'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1',
'transient_lastDdlTime'='1646423472')