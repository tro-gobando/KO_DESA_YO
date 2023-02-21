CREATE EXTERNAL TABLE db_koandina_br_analyticssec.hrpa9816_analyticssec(
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
DT_IN_FER_C1 string,
DT_FIM_FER_C1 string,
QTDE_DIA_FER_C1 string,
QTDE_DIA_ABO_C1 string,
IND_ANTEC_13_C1 string,
SIT_PRGRM_FER_1 string,
DT_IN_FER_EF1 string,
DT_FIM_FER_EF1 string,
QTDE_DIA_FER_EF1 string,
QTDE_DIA_ABO_EF1 string,
IND_ANTEC_13_EF1 string,
DT_IN_FER_C2 string,
DT_FIM_FER_C2 string,
QTDE_DIA_FER_C2 string,
QTDE_DIA_ABO_C2 string,
IND_ANTEC_13_C2 string,
SIT_PRGRM_FER_2 string,
DT_IN_FER_EF2 string,
DT_FIM_FER_EF2 string,
QTDE_DIA_FER_EF2 string,
QTDE_DIA_ABO_EF2 string,
IND_ANTEC_13_EF2 string,
DT_IN_PER_AQUIS string,
DT_FIM_PER_AQUIS string,
DT_IN_FER_C3 string,
DT_FIM_FER_C3 string,
QTDE_DIA_FER_C3 string,
QTDE_DIA_ABO_C3 string,
IND_ANTEC_13_C3 string,
DT_IN_FER_EF3 string,
DT_FIM_FER_EF3 string,
QTDE_DIA_FER_EF3 string,
QTDE_DIA_ABO_EF3 string,
IND_ANTEC_13_EF3 string
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/br/sap/hrpa9816'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')