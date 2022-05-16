CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0006_stagesec(
PERNR STRING,
SUBTY STRING,
OBJPS STRING,
SPRPS STRING,
ENDDA STRING,
BEGDA STRING,
SEQNR STRING,
AEDTM STRING,
UNAME STRING,
HISTO STRING,
ITXEX STRING,
REFEX STRING,
ORDEX STRING,
ITBLD STRING,
PREAS STRING,
FLAG1 STRING,
FLAG2 STRING,
FLAG3 STRING,
FLAG4 STRING,
RESE1 STRING,
RESE2 STRING,
GRPVL STRING,
ANSSA STRING,
NAME2 STRING,
STRAS STRING,
ORT01 STRING,
ORT02 STRING,
PSTLZ STRING,
LAND1 STRING,
TELNR STRING,
ENTKM STRING,
WKWNG STRING,
BUSRT STRING,
LOCAT STRING,
ADR03 STRING,
ADR04 STRING,
STATE STRING,
HSNMR STRING,
POSTA STRING,
BLDNG STRING,
FLOOR STRING,
STRDS STRING,
ENTK2 STRING,
COM01 STRING,
NUM01 STRING,
COM02 STRING,
NUM02 STRING,
COM03 STRING,
NUM03 STRING,
COM04 STRING,
NUM04 STRING,
COM05 STRING,
NUM05 STRING,
COM06 STRING,
NUM06 STRING,
INDRL STRING,
COUNC STRING,
RCTVC STRING,
OR2KK STRING,
CONKK STRING,
OR1KK STRING,
RAILW STRING,
YYHRMBUILD STRING,
YYHRMWRKHM STRING,
YYHRMMAILC STRING,
YYHRMOFFPH STRING,
YYHRMMOBPH STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0006'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')