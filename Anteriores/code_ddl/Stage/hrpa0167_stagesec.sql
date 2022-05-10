CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0167_stagesec(
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
    BAREA string,
    PLTYP string,
    BPLAN string,
    BENGR string,
    BSTAT string,
    ELIDT string,
    ELDTO string,
    PARDT string,
    BOPTI string,
    DEPCV string,
    COORD string,
    PROVI string,
    POLNR string,
    ENRTY string,
    EVENT string,
    EOGRP string,
    EOIRQ string,
    EOIPR string,
    PRETX string,
    CSTOV string,
    BNCST string,
    PERIO string,
    CURRE string,
    DTY01 string,
    DID01 string,
    DTY02 string,
    DID02 string,
    DTY03 string,
    DID03 string,
    DTY04 string,
    DID04 string,
    DTY05 string,
    DID05 string,
    DTY06 string,
    DID06 string,
    DTY07 string,
    DID07 string,
    DTY08 string,
    DID08 string,
    DTY09 string,
    DID09 string,
    DTY10 string,
    DID10 string,
    DTY11 string,
    DID11 string,
    DTY12 string,
    DID12 string,
    DTY13 string,
    DID13 string,
    DTY14 string,
    DID14 string,
    DTY15 string,
    DID15 string,
    DTY16 string,
    DID16 string,
    DTY17 string,
    DID17 string,
    DTY18 string,
    DID18 string,
    DTY19 string,
    DID19 string,
    DTY20 string,
    DID20 string)
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
  's3://stagesec-koandina-prod/regional/sap/hrpa0167/'
TBLPROPERTIES (
'compressionType'='SNAPPY')