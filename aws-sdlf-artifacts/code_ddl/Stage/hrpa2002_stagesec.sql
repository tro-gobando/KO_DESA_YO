CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa2002_stagesec(
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
    BEGUZ string,
    ENDUZ string,
    VTKEN string,
    AWART string,
    ABWTG string,
    ABRTG string,
    ABRST string,
    KALTG string,
    STDAZ string,
    LGART string,
    BWGRL string,
    AUFKZ string,
    VERSL string,
    TRFGR string,
    TRFST string,
    PRAKN string,
    PRAKZ string,
    OTYPE string,
    PLANS string,
    GENER string,
    EXBEL string,
    HRSIF string,
    ALLDF string,
    WAERS string,
    LOGSYS string,
    AWTYP string,
    AWREF string,
    AWORG string,
    DOCSY string,
    DOCNR string,
    WTART string,
    FAPRS string,
    TDLANGU string,
    TDSUBLA string,
    TDTYPE string,
    KEPAU string,
    EXPAU string,
    PBEG1 string,
    PEND1 string,
    PBEZ1 string,
    PUNB1 string,
    PBEG2 string,
    PEND2 string,
    PBEZ2 string,
    PUNB2 string,
    NXDFL string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpa2002/'
TBLPROPERTIES (
'compressionType'='SNAPPY')