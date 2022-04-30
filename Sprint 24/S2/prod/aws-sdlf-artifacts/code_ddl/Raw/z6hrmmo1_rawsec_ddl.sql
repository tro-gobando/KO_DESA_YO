CREATE EXTERNAL TABLE IF NOT EXISTS db_koandina_cl_raw.z6hrmmo1_raw(
PABRP string,
PABRJ string,
BUKRS string,
PERNR string,
NACHN string,
NACH2 string,
VORNA string,
ANTIG string,
NATIO string,
FATXT string,
SINDI string,
PBTXT string,
BTRTX string,
RUT string,
UNAME string,
FING string,
FBAJA string,
FNAC string,
SEXO string,
PLANS string,
PLANSTXT string,
STELL string,
TRFAR string,
TARTX string,
TCTTO string,
FFIN string,
KOSTL string,
KTEXT string,
GERE1 string,
GERE2 string,
ROTAC string,
ROL string,
FTE string,
COMUNA string,
SUELDOBASE string,
AFP string,
NOMAFP string,
PERSK string,
PERSKTXT string,
TURNOCOD string,
TURNODESCRIP string,
NOMISAPRE string,
ORGEH string,
ORGEH_TXT string,
GRADO_HAY string,
INC_LABORAL string)
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
's3://raw-koandina-$ENV/cl/sap/z6hrmmo1/'
TBLPROPERTIES (
'skip.header.line.count'='1')