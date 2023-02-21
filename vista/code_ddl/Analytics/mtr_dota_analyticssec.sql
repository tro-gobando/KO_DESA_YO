CREATE EXTERNAL TABLE db_koandina_regional_analyticssec.mtr_dota_analyticssec(
--anio            INT             COMMENT 'Año del registro',
--mes             INT             COMMENT 'Mes del registro',
nro_pers        DECIMAL(8)      COMMENT 'nuemero de identificacion del empleado',
nomb_pers       VARCHAR(30)     COMMENT 'nomnre del empleado',
cod_sociedad    VARCHAR(4)      COMMENT 'codigo de la sociedad',
sociedad        VARCHAR(25)     COMMENT 'Nombre de la sociedad',
operacion       VARCHAR(10)     COMMENT 'Nombre de la operación',
localidad       VARCHAR(15)     COMMENT 'Localidad del empleado ',
zona            VARCHAR(15)     COMMENT 'Zona del empleado',
gerencia_1      VARCHAR(40)     COMMENT 'Gerencia 1 del empleado',
gerencia_2      VARCHAR(40)     COMMENT 'Gerencia 2 del empleado',
cod_un_org      DECIMAL(8)      COMMENT 'Codigo de la unidad organizativa',
desc_un_org     STRING          COMMENT 'Gerencia 2 del empleado'
grado_hay       VARCHAR(8)      COMMENT 'Grado Hay del empleado',
rotacion        VARCHAR(20)     COMMENT 'Rotacion del empleado',
rol             VARCHAR(20)     COMMENT 'Rol del empleado',
genero          VARCHAR(60)     COMMENT 'Genero del empleado',
nacionalidad    VARCHAR(15)     COMMENT 'Nacionalidad del empleado',
condicion       VARCHAR(2)      COMMENT 'Indicador de condicion de discapacidad',
fech_ing        DATE            COMMENT 'Fecha de ingreso del empleado',
fech_nac        DATE            COMMENT 'Fecha de nacimiento del empleado',
cargo           VARCHAR(40)     COMMENT 'Cargo del empleado',
centro_costo    VARCHAR(100)    COMMENT 'Centro de costo asociado al empleado',
cen_cost_imp    VARCHAR(30)     COMMENT 'Centro de costo de imputacion del empleado',
idioma          VARCHAR(1)      COMMENT 'Idiama de la region a la que pertenece el emplado',
mail            VARCHAR(241)    COMMENT 'e-mail del empleado'
)
PARTITIONED BY (
  anio int,
  mes int
--dt_month string COMMENT 'Fecha de caraga del registro'
)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'
STORED AS INPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  's3://analyticssec-koandina-dev/regional/sap/mtr_dota'
TBLPROPERTIES (
  'transient_lastDdlTime'='1611597300')