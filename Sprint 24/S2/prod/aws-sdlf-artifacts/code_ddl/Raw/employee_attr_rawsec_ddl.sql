CREATE TABLE db_koandina_regional_raw.employee_attr_rawsec(
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
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '\;'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://rawsec-koandina-prod/regional/sap/employee_attr'
TBLPROPERTIES (
  'skip.header.line.count'='1',
  'transient_lastDdlTime'='1642004173')