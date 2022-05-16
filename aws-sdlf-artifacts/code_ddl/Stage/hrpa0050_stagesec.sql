CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpa0050_stagesec(
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
    ZAUSW string,
    ZAUVE string,
    ZABAR string,
    BDEGR string,
    ZANBE string,
    ZDGBE string,
    ZMAIL string,
    ZPINC string,
    GLMAX string,
    GLMIN string,
    ZTZUA string,
    ZMGEN string,
    ZUSKZ string,
    PMBDE string,
    GRAWG string,
    GRELG string)
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
  's3://stagesec-koandina-prod/regional/sap/hrpa0050/'
TBLPROPERTIES (
'compressionType'='SNAPPY')