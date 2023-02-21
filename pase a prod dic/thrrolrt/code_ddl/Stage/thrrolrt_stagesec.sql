CREATE EXTERNAL TABLE db_koandina_py_stage.thrrolrt_stagesec(
    persk    string,
    cttyp    string,
    jcode    string,
    rol      string,
    rotacion string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/py/sap/thrrolrt/'
TBLPROPERTIES (
'compressionType'='SNAPPY')