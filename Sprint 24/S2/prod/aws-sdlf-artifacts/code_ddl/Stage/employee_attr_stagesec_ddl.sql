CREATE EXTERNAL TABLE IF NOT EXISTS db_koandina_regional_stage.employee_attr_stage(
BEGDA string,
ENDDA string,
PERNR string,
RFPNR string,
BUKRS string,
WERKS string,
BTRTL string,
PERSG string,
PERSK string,
ORGEH string,
STELL string,
PLANS string,
KOKRS string,
KOSTL string,
ABKRS string,
MOLGA string,
TRFAR string,
TRFGB string,
TRFKZ string,
TRFGR string,
TRFST string,
BSGRD string,
--ANSAL string,
ANCUR string,
EMPCT string,
STAT2 string,
NCSDATE string,
SLTYP string,
SLREG string,
SLGRP string,
SLLEV string,
ANSVH string,
VDSK1 string,
SNAME string,
CPIND string,
BIGESG string,
BIGELV string,
BIGPSG string,
TEILK string,
PLANT string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://stage-koandina-prod/regional/sap/employee_attr/'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')