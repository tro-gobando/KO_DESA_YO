CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.hrpa2001_analyticssec(
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
STDAZ string,
ABRTG string,
ABRST string,
ANRTG string,
LFZED string,
KRGED string,
KBBEG string,
RMDDA string,
KENN1 string,
KENN2 string,
KALTG string,
URMAN string,
BEGVA string,
BWGRL string,
AUFKZ string,
TRFGR string,
TRFST string,
PRAKN string,
PRAKZ string,
OTYPE string,
PLANS string,
MLDDA string,
MLDUZ string,
RMDUZ string,
VORGS string,
UMSKD string,
UMSCH string,
REFNR string,
UNFAL string,
STKRV string,
STUND string,
PSARB string,
AINFT string,
GENER string,
HRSIF string,
ALLDF string,
WAERS string,
LOGSYS string,
AWTYP string,
AWREF string,
AWORG string,
DOCSY string,
DOCNR string,
PAYTY string,
PAYID string,
BONDT string,
OCRSN string,
SPPE1 string,
SPPE2 string,
SPPE3 string,
SPPIN string,
ZKMKT string,
FAPRS string,
TDLANGU string,
TDSUBLA string,
TDTYPE string,
NXDFL string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/hrpa2001/'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')