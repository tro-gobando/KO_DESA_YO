CREATE OR REPLACE VIEW "vw_maestra_dotacion_analyticssec" AS
SELECT
  anio
, mes
, nro_pers
, nomb_pers
, cod_sociedad
, sociedad
, opeacion operacion
, localidad
, zona
, gerencia_1
, gerencia_2
, grado_hay
, rotacion
, rol
, genero
, nacionalidad
, condicion
, fech_ing
, fech_nac
, cargo
, centro_costo
, cen_cost_imp
, idioma
, mail
FROM
  db_koandina_regional_analyticssec.mtr_dota_analyticssec
