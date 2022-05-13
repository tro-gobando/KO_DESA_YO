CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0022_stagesec(
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
    SLART string,
    INSTI string,
    SLAND string,
    AUSBI string,
    SLABS string,
    ANZKL string,
    ANZEH string,
    SLTP1 string,
    SLTP2 string,
    JBEZ1 string,
    WAERS string,
    SLPLN string,
    SLKTR string,
    SLRZG string,
    KSBEZ string,
    TX122 string,
    SCHCD string,
    FACCD string,
    DPTMT string,
    EMARK string,
    YYCERTTITLE string,
    YYAWARDS string,
    YYSCYEAR string,
    YYSUBBRANCH string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa0022/'
TBLPROPERTIES (
'compressionType'='SNAPPY')