CREATE EXTERNAL TABLE db_koandina_cl_raw.z6hrmmohe_rawsec(
pernr string,
fecha string,
tipodia string,
status string,
ctd_he string,
ctd_he_apr string,
ctd_he_rec string,
ctd_he_rez string,
ctd_he_pla string,
tipo_he string,
tipo_he2 string,
user_he string,
dats_he string,
time_he string,
user_he_rez string,
dats_he_rez string,
time_he_rez string,
cl_t_he_rez string,
kostl string,
marcax string,
turno string,
entra_plan string,
sale_plan string,
entra_real string,
sale_real string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
's3://rawsec-koandina-$ENV/cl/sap/z6hrmmohe'
TBLPROPERTIES (
'skip.header.line.count'='1',
'transient_lastDdlTime'='1646165767')