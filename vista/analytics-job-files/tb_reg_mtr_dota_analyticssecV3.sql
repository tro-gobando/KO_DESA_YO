WITH
employee_attr AS (
    SELECT ea.begda,
           ea.endda,
           ea.pernr,
           ea.bukrs,
           ea.werks,
           ea.btrtl,
           ea.orgeh,
           ea.stell,
           ea.plans,
           ea.kokrs,
           ea.kostl,
           ea.trfar,
           ea.sname,
           ea.persk,
    FROM db_koandina_regional_analyticssec.employee_attr_analyticssec ea
)

SELECT DISTINCT
    cast(ea.pernr as INT)				AS nro_pers,
    ea.sname							AS nomb_pers,
    ea.bukrs							AS cod_sociedad,
    ea.pernr							AS sociedad,
	ea.pernr							AS operacion,
    ea.pernr							AS localidad,
	ea.pernr							AS zona,
	ea.pernr							AS gerencia_1,
	ea.pernr							AS gerencia_2,
    cast(ea.pernr as int)				AS cod_un_org,
    ea.orgeh							AS desc_un_org,
    ea.pernr							AS grado_hay,
    ea.pernr							AS rotacion,
    ea.pernr							AS rol,
    ea.pernr							AS genero,
    ea.pernr							AS nacionalidad,
    ea.pernr							AS condicion,
    to_date(ea.begda,'yyyy-MM-dd')		AS fech_ing,
    to_date(ea.endda,'yyyy-MM-dd')		AS fech_nac,
	ea.pernr							AS cargo,
    ea.pernr							AS centro_costo,
    ea.pernr							AS cen_cost_imp,
    ea.pernr							AS idioma,
    ea.pernr							AS mail,
    cast(ea.pernr as int)				AS anio,
	cast(ea.pernr as int)               AS mes
FROM employee_attr ea
