WITH
employee_attr AS (
    SELECT ea.begda,
           ea.endda,
           ea.pernr,
           ea.rfpnr,
           ea.bukrs,
           ea.werks,
           ea.btrtl,
           ea.persg,
           ea.persk,
           ea.orgeh,
           ea.stell,
           ea.plans,
           ea.kokrs,
           ea.kostl,
           ea.abkrs,
           ea.molga,
           ea.trfar,
           ea.trfgb,
           ea.trfkz,
           ea.trfgr,
           ea.trfst,
           ea.bsgrd,
           ea.ancur,
           ea.empct,
           ea.stat2,
           ea.ncsdate,
           ea.sltyp,
           ea.slreg,
           ea.slgrp,
           ea.sllev,
           ea.ansvh,
           ea.vdsk1,
           ea.sname,
           ea.cpind,
           ea.bigesg,
           ea.bigelv,
           ea.bigpsg,
           ea.teilk,
           ea.plant,
           tie.fecha,
           tie.anio,
           tie.mes
    FROM db_koandina_regional_analyticssec.employee_attr_analyticssec ea
    LEFT JOIN db_koandina_regional_stage.dim_tiempo_stage tie
              ON tie.fecha BETWEEN to_date(ea.begda, "yyyy-MM-dd") AND
                 CASE WHEN to_date(ea.endda, "yyyy-MM-dd") > current_date THEN current_date ELSE to_date(ea.endda, "yyyy-MM-dd") END
),
rota1 AS (
    select trfar, stell,  rotacion
    from db_koandina_cl_analyticssec.hrt024_analyticssec
    where stell = '00000000'
),
rota2 AS (
    select distinct trfar, stell,  rotacion
    from db_koandina_cl_analyticssec.hrt024_analyticssec
    where stell != '00000000'
),
rol1 AS (
    select trfar, stell,  rol
    from db_koandina_cl_analyticssec.hrt024_analyticssec
    where stell = '00000000'
),
rol2 AS (
    select distinct trfar, stell,  rol
    from db_koandina_cl_analyticssec.hrt024_analyticssec
    where stell != '00000000'
),
email AS (
    select distinct
        pa0105.usrid_long,
        pa0105.pernr,
        pa0105.begda,
        pa0105.endda
    from db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105
    where pa0105.usrty = '0010'
)
SELECT DISTINCT
    ea1.anio                                                     AS anio,
    ea1.mes                                                      AS mes,
    ea1.pernr                                                    AS nro_pers,
    ea1.sname                                                    AS nomb_pers,
    cct.key1                                                     AS cod_sociedad,
    cct.txtmd                                                    AS sociedad,
    CASE WHEN cct.key1 = '3046' or cct.key1 = '3047'
            THEN 'Argentina'
         WHEN cct.key1 = '3048'
            THEN 'Brasil'
         WHEN cct.key1 = '3043' or cct.key1 = '3044' or cct.key1 = '3045' or cct.key1 = '3050'
            THEN 'Chile'
         WHEN cct.key1 = '3049'
            THEN 'Paraguay'
        --  ELSE 'Otro'
    END                                                         AS operacion,
    pstt.txtsh                                                  AS localidad,
    CASE WHEN ea1.werks = '8C1F' OR ea1.werks = '8C2F'
            THEN 'Antofagasta'
         WHEN ea1.werks  = '8C1Q' OR ea1.werks  = '8C2Q'
            THEN 'Coquimbo'
         WHEN ea1.werks  = '8C1G' OR ea1.werks  = '8C2G'
            THEN 'Punta Arenas'
         ELSE 'Centro'
    END                                                         AS zona,
    t23.gerencia1                                               AS gerencia_1,
    t23.gerencia2                                               AS gerencia_2,
    p1051.jcode                                                 AS grado_hay,
    coalesce(rota2.rotacion,rota1.rotacion)                     AS rotacion,
    coalesce(rol2.rol,rol1.rol)                                 AS rol,
    gen.txtlg                                                   AS genero,
    t005t.natio                                                 AS nacionalidad,
    CASE WHEN pa0004.sbgru IS NOT NULL THEN 'SI' ELSE 'NO' END  AS condicion,
    pa0041.dat01                                                AS fech_ing,
    pa0002.gbdat                                                AS fech_nac,
    pos.txtmd                                                   AS cargo,
    ccos.txtmd                                                  AS centro_costo,
    CASE WHEN (ea1.bukrs = '3043' OR ea1.bukrs = '3044')
            THEN ea1.kostl
         WHEN (ea1.bukrs = '3045' OR ea1.bukrs = '3050')
            THEN con.orige
    END                                                         AS cen_cost_imp,
    pa0002.sprsl                                                AS idioma,
    pa0105.usrid_long                                           AS mail
FROM employee_attr ea1
LEFT JOIN db_koandina_regional_analytics.comp_code_text_analytics cct
       ON ea1.bukrs = cct.key1
LEFT JOIN db_koandina_regional_analytics.hrpers_sarea_2_text_analytics pstt
       ON ea1.btrtl = pstt.btrtl AND
          ea1.werks = pstt.werks
LEFT JOIN db_koandina_cl_analyticssec.hrt023_analyticssec t23
       ON ea1.kostl = t23.kostl
LEFT JOIN db_koandina_regional_analyticssec.hrp1051_analyticssec p1051
       ON p1051.plvar = '01' AND
          p1051.otype = 'S'  AND
          p1051.subty = 'HAY' AND
          p1051.objid = ea1.plans AND
          to_date(p1051.begda, "yyyy-MM-dd") <= ea1.fecha AND
          to_date(p1051.endda, "yyyy-MM-dd") >= ea1.fecha
LEFT JOIN rota1 rota1
       ON rota1.trfar = ea1.trfar AND
          rota1.stell = '00000000'
LEFT JOIN rota2 rota2
       ON rota2.trfar = ea1.trfar AND
          rota2.stell = ea1.stell
LEFT JOIN rol1 rol1
       ON rol1.trfar = ea1.trfar AND
          rol1.stell = '00000000'
LEFT JOIN rol2 rol2
       ON rol2.trfar = ea1.trfar AND
          rol2.stell = ea1.stell
LEFT JOIN db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
       ON ea1.pernr = pa0002.pernr AND
          pa0002.sprsl = 'S'
LEFT JOIN db_koandina_regional_analytics.hrgender2text_analytics gen
       ON gen.key1 = pa0002.gesch AND
          gen.langu = pa0002.sprsl
LEFT JOIN db_koandina_regional_analyticssec.hrt005t_analyticssec t005t
       ON t005t.land1 = pa0002.natio AND
          t005t.spras = pa0002.sprsl
LEFT JOIN db_koandina_regional_analyticssec.hrpa0004_analyticssec pa0004
       ON pa0004.pernr = ea1.pernr AND
          to_date(pa0004.endda, "yyyy-MM-dd") >= ea1.fecha AND
          to_date(pa0004.begda, "yyyy-MM-dd") <= ea1.fecha
LEFT JOIN db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
       ON pa0041.pernr = ea1.pernr AND
          to_date(pa0041.endda, "yyyy-MM-dd") >= ea1.fecha AND
          to_date(pa0041.begda, "yyyy-MM-dd") <= ea1.fecha
LEFT JOIN db_koandina_regional_analytics.hrposition_text_analytics pos
       ON pos.key1 = ea1.plans AND
          pos.langu = pa0002.sprsl
LEFT JOIN db_koandina_regional_analytics.costcenter_text_analytics ccos
       ON ccos.kokrs = ea1.kokrs AND
          ccos.kostl = ea1.kostl AND
          ccos.langu = pa0002.sprsl AND
          ccos.dateto >= ea1.fecha AND
          ccos.datefrom <= ea1.fecha
LEFT JOIN db_koandina_cl_analyticssec.hrconve_analyticssec con
       ON con.desti = ea1.kostl
LEFT JOIN email pa0105
       ON pa0105.pernr = ea1.pernr AND
          to_date(pa0105.begda, "yyyy-MM-dd") <= ea1.fecha AND
          to_date(pa0105.endda, "yyyy-MM-dd") >= ea1.fecha
WHERE year(ea1.fecha) >= year(current_date)-2