CREATE EXTERNAL TABLE db_koandina_cl_stage.z6hrmmo3_stagesec(
bukrs string,
pabrj string,
pabrp string,
kostl string,
pernr string,
begda string,
endda string,
diasv string,
saldo string,
rotac string,
rol string)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
's3://stagesec-koandina-$ENV/cl/sap/z6hrmmo3'
TBLPROPERTIES (
'COLUMN_STATS_ACCURATE'='false',
'compressionType'='SNAPPY',
'numFiles'='0',
'numRows'='-1',
'rawDataSize'='-1',
'skip.header.line.count'='1',
'spark.sql.create.version'='2.2 or prior',
'spark.sql.sources.schema.numParts'='1')