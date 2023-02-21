CREATE OR REPLACE VIEW "vw_hr_est_gral_analyticssec" AS
select
 anio
,mes
,operacion
,operacion_original
,nro_personal
,nombre
,ceco
,ceco_descripcion
,nivel_1
,nivel_2
,nivel_3
,unidorg
,unidorg_descripcion
,cod_cargo
,desc_cargo
,cod_posicion
,desc_posicion
,dir
,gestion
,subgestion
,cargo_vendedor
,sectores
,areas
,area_kpi
from db_koandina_regional_analyticssec.hr_est_gral_analyticssec