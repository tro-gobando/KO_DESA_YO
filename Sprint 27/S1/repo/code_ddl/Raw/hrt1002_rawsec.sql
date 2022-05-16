<<<<<<< HEAD:aws-sdlf-artifacts/code_ddl/Raw/hrt044_rawsec.sql
CREATE EXTERNAL TABLE db_koandina_cl_raw.hrt044_rawsec(
PERNR STRING,
BEGDA STRING,
COD_UEN STRING,
COD_ZON STRING,
TERRITC STRING,
UNAME STRING,
AEDTM STRING
)
=======
CREATE EXTERNAL TABLE db_koandina_regional_raw.hrt1002_rawsec(
    TABNR string,
    TABSEQNR string,
    TLINE string,
    TFORMAT string)
>>>>>>> origin/main:Sprint 27/S1/repo/code_ddl/Raw/hrt1002_rawsec.sql
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
<<<<<<< HEAD:aws-sdlf-artifacts/code_ddl/Raw/hrt044_rawsec.sql
  's3://rawsec-koandina-prod/cl/sap/hrt044'
=======
  's3://rawsec-koandina-prod/regional/sap/hrt1002/'
>>>>>>> origin/main:Sprint 27/S1/repo/code_ddl/Raw/hrt1002_rawsec.sql
TBLPROPERTIES (
  'skip.header.line.count'='1', 
  'spark.sql.partitionProvider'='catalog')