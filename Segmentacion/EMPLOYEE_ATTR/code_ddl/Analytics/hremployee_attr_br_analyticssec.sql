CREATE EXTERNAL TABLE db_koandina_br_analyticssec.hremployee_attr_br_analyticssec (
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
PLANT string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-dev/br/sap/hremployee_attr/'
TBLPROPERTIES ('compressionType'='SNAPPY');