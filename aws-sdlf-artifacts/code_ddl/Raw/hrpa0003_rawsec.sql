CREATE EXTERNAL TABLE db_koandina_regional_raw.hrpa0003_rawsec(
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
    ABRSP string,
    ABRDT string,
    RRDAT string,
    RRDAF string,
    KOABR string,
    PRDAT string,
    PKGAB string,
    ABWD1 string,
    ABWD2 string,
    BDERR string,
    BDER1 string,
    KOBDE string,
    TIMRC string,
    DAT00 string,
    UHR00 string,
    INUMK string,
    WERKS string,
    SACHZ string,
    SFELD string,
    ADRUN string,
    VIEKN string,
    TRVFL string,
    RCBON string,
    PRTEV string)
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
  's3://rawsec-koandina-dev/regional/sap/hrpa0003/'
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')