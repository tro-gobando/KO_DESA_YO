CREATE OR REPLACE VIEW "vw_hr_est_terceros_analyticssec" AS
select
 anio
,semestre
,operacion
,nivel_1
,nivel_2
,nivel_3
,valor
from db_koandina_regional_analyticssec.hr_est_terceros_analyticssec