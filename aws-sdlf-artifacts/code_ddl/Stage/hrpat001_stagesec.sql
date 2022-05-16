CREATE EXTERNAL TABLE db_koandina_regional_stage.hrpat001_stagesec(
ACTIVO string,
BUKRS string,
PERNR string,
PLANS string,
PLSTX string,
ORGEH string,
ORGTX string,
PERNR_BOSS string,
NOMBRE_BOSS string,
PLANS_BOSS string,
PLSTX_BOSS string,
ORGEH_BOSS string,
ORGTX_BOSS string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.serde2.OpenCSVSerde' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://stagesec-koandina-prod/regional/sap/hrpat001/'
TBLPROPERTIES (
'compressionType'='SNAPPY')