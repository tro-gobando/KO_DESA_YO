CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0032_stagesec(
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
PNALT STRING,
WAUSW STRING,
PKWRG STRING,
PKWWR STRING,
KFZKZ STRING,
WAERS STRING,
ANLNR STRING,
GEBNR STRING,
ZIMNR STRING,
TEL01 STRING,
TEL02 STRING,
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
COLETOR1 STRING,
DESCRICAO1 STRING,
NATUREZA1 STRING,
COLETOR2 STRING,
DESCRICAO2 STRING,
NATUREZA2 STRING,
COLETOR3 STRING,
DESCRICAO3 STRING,
NATUREZA3 STRING,
COLETOR4 STRING,
DESCRICAO4 STRING,
NATUREZA4 STRING,
COLETOR5 STRING,
DESCRICAO5 STRING,
NATUREZA5 STRING,
COLETOR6 STRING,
DESCRICAO6 STRING,
NATUREZA6 STRING,
COLETOR7 STRING,
DESCRICAO7 STRING,
NATUREZA7 STRING,
COLETOR8 STRING,
DESCRICAO8 STRING,
NATUREZA8 STRING,
COLETOR9 STRING,
DESCRICAO9 STRING,
NATUREZA9 STRING,
COLETOR10 STRING,
DESCRICAO10 STRING,
NATUREZA10 STRING,
COLETOR11 STRING,
DESCRICA11 STRING,
NATUREZA11 STRING,
COLETOR12 STRING,
DESCRICA12 STRING,
NATUREZA12 STRING,
COLETOR13 STRING,
DESCRICA13 STRING,
NATUREZA13 STRING,
COLETOR14 STRING,
DESCRICAO14 STRING,
NATUREZA14 STRING,
COLETOR15 STRING,
DESCRICAO15 STRING,
NATUREZA15 STRING,
COLETOR16 STRING,
DESCRICAO16 STRING,
NATUREZA16 STRING,
COLETOR17 STRING,
DESCRICAO17 STRING,
NATUREZA17 STRING,
COLETOR18 STRING,
DESCRICAO18 STRING,
NATUREZA18 STRING,
COLETOR19 STRING,
DESCRICAO19 STRING,
NATUREZA19 STRING,
COLETOR20 STRING,
DESCRICAO20 STRING,
NATUREZA20 STRING,
COUNTER STRING
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/regional/sap/hrpa0032'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')