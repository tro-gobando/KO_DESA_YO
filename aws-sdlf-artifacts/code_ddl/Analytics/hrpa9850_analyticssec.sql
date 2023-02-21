CREATE EXTERNAL TABLE db_koandina_br_analyticssec.hrpa9850_analyticssec(
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
    VLREF string,
    VALI string,
    CODSEV string,
    COMI string,
    PLUC string,
    GFER string,
    PLSA string,
    ZSAVP string,
    LANCH string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/br/sap/hrpa9850/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')