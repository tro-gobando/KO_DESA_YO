CREATE EXTERNAL TABLE db_koandina_br_stage.hrthrtcdir_stagesec(
    KOSTL string,
    ENDDA string,
    BEGDA string,
    DSDIR string,
    DIRRE string,
    GESTA string,
    SUBGE string,
    LOCLI string,
    INDIC string
  )
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://stagesec-koandina-dev/br/sap/hrthrtcdir'
TBLPROPERTIES (
'compressionType'='SNAPPY',
'skip.header.line.count'='1')