CREATE EXTERNAL TABLE IF NOT EXISTS db_koandina_regional_stage.employee_text_stagesec(
datefrom string,
dateto string,
pernr string,
txtmd string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://stagesec-koandina-$ENV/regional/sap/employee_text/'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')