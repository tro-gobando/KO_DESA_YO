CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0022_rawsec(
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
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
WITH SERDEPROPERTIES ( 
  'quoteChar'='\"', 
  'separatorChar'='\;') 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://rawsec-koandina-prod/regional/sap/hrpa0022/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')