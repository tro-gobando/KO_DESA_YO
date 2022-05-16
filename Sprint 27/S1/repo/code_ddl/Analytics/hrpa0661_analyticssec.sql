CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpa0661_analyticssec(
    PERNR string,
    SUBTY string,
    OBJPS string,
    SPRPS string,
    ENDDA string,
    BEGDA string,
    SEQNR string,
    AEDTM string,
    UNAME string,
    HISTO string,
    ITXEX string,
    REFEX string,
    ORDEX string,
    ITBLD string,
    PREAS string,
    FLAG1 string,
    FLAG2 string,
    FLAG3 string,
    FLAG4 string,
    RESE1 string,
    RESE2 string,
    GRPVL string,
    TIPTE string,
    EGGRP string,
    WAERS string,
    PRENO string,
    PREAV string,
    PREAT string,
    FGTSB string,
    FGTSP string,
    FGTSR string,
    AR479 string,
    DT479 string,
    ND479 string,
    COI01 string,
    NUM01 string,
    AMT01 string,
    PCT01 string,
    COI02 string,
    NUM02 string,
    AMT02 string,
    PCT02 string,
    COI03 string,
    NUM03 string,
    AMT03 string,
    PCT03 string,
    COI04 string,
    NUM04 string,
    AMT04 string,
    PCT04 string,
    COI05 string,
    NUM05 string,
    AMT05 string,
    PCT05 string,
    COI06 string,
    NUM06 string,
    AMT06 string,
    PCT06 string,
    COI07 string,
    NUM07 string,
    AMT07 string,
    PCT07 string,
    COI08 string,
    NUM08 string,
    AMT08 string,
    PCT08 string,
    COI09 string,
    NUM09 string,
    AMT09 string,
    PCT09 string,
    COI10 string,
    NUM10 string,
    AMT10 string,
    PCT10 string,
    COI11 string,
    NUM11 string,
    AMT11 string,
    PCT11 string,
    COI12 string,
    NUM12 string,
    AMT12 string,
    PCT12 string,
    COI13 string,
    NUM13 string,
    AMT13 string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-prod/regional/sap/hrpa0661/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')