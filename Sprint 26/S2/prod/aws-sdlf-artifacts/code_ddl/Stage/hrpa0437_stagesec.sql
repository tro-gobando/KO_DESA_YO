CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0437_stagesec(
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
EMPLO string,
LGA01 string,
BET01 string,
LGA02 string,
BET02 string,
LGA03 string,
BET03 string,
LGA04 string,
BET04 string,
LGA05 string,
BET05 string,
LGA06 string,
BET06 string,
LGA07 string,
BET07 string,
LGA08 string,
BET08 string,
LGA09 string,
BET09 string,
LGA10 string,
BET10 string,
LGA11 string,
BET11 string,
LGA12 string,
BET12 string,
LGA13 string,
BET13 string,
LGA14 string,
BET14 string,
LGA15 string,
BET15 string,
LGA16 string,
BET16 string,
LGA17 string,
BET17 string,
LGA18 string,
BET18 string,
LGA19 string,
BET19 string,
LGA20 string,
BET20 string,
NRINC string,
CATTR string,
CPF_NR string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0437'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')