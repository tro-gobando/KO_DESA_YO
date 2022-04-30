CREATE EXTERNAL TABLE db_koandina_cl_analyticssec.z6hrmmo5_analyticssec
(
PERNR string,
PABRP string,
PABRJ string,
BEGDA string,
ENDDA string,
RUT string,
NOMBRE string,
BUKRS string,
MOV string,
TIPOMOV string,
WERKS string,
BTRTL string,
KOSTL string,
KOSTLTXT string,
PLANS string,
PLANSTXT string,
FECHAING string,
FECHAEGR string,
ROTACION string,
GERENCIA1 string,
GERENCIA2 string,
CTTYP string,
CTTXT string,
CAUSAL string,
ORGEH string,
ORGEHTXT string,
TRFAR string,
TARTX string,
SEXO string,
ROL string,
NATSL string,
NATIO string,
COMUNA string,
GBDAT string,
FAMST string,
FATXT string
)
ROW FORMAT SERDE
'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS PARQUET
LOCATION 's3://analyticssec-koandina-$ENV/cl/sap/z6hrmmo5/'
TBLPROPERTIES ('compressionType'='SNAPPY');