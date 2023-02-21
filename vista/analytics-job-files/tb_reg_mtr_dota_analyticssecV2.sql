/*
 Author:      gobando
 Create date: 14/06/2022
 Description: Logica para la carga de la tabla maestra de dotacion.
 Change log: 14/06/2022 Creación del script.
             22/06/2022 Se agrgan los campos de de unidad organizativa; cod_un_org, desc_un_org.
             30/06/2022 Se agrega logica para el calculo de los campos gerencia1 y gerencia2.
                        Se agrega logica para el calculo del campo fech_nac.
                        Se agrega logica para el calculo del campo cargo.
             12/07/2022 Secuencial la generacion de campos

*/

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
           tie.fecha,
           tie.anio,
           tie.mes,
           tie.dia
    FROM db_koandina_regional_stage.employee_attr_stagesec ea
    LEFT JOIN db_koandina_regional_stage.dim_tiempo_stage tie
              ON tie.fecha BETWEEN to_date(ea.begda, "yyyy-MM-dd") AND
                 CASE WHEN to_date(ea.endda, "yyyy-MM-dd") > current_date THEN current_date ELSE to_date(ea.endda, "yyyy-MM-dd") END
    WHERE --year(ea.fecha) >= year(current_date)-2
          year(tie.fecha) = year(current_date)-1 and
          month(tie.fecha) < month(current_date)
),

p1051 as (
select distinct
    ea.begda,
    ea.endda,
    ea.bukrs,
    ea.werks,
    ea.btrtl,
    ea.stell,
    ea.plans,
    ea.kokrs,
    ea.kostl,
    ea.trfar,
    ea.fecha,
    ea.anio                                                     AS anio,
    ea.mes                                                      AS mes,
    ea.pernr                                                    AS nro_pers,
    ea.sname                                                    AS nomb_pers,
    CASE WHEN ea.werks = '8C1F' OR ea.werks = '8C2F'
            THEN 'Antofagasta'
         WHEN ea.werks  = '8C1Q' OR ea.werks  = '8C2Q'
            THEN 'Coquimbo'
         WHEN ea.werks  = '8C1G' OR ea.werks  = '8C2G'
            THEN 'Punta Arenas'
         ELSE 'Centro'
    END                                                         AS zona,
    ea.orgeh                                                    AS cod_un_org,
    p1051.jcode                                                 AS grado_hay
    from employee_attr ea
LEFT JOIN db_koandina_regional_stage.hrp1051_stagesec p1051
       ON p1051.plvar = '01' AND
          p1051.otype = 'S'  AND
          p1051.subty = 'HAY' AND
          p1051.objid = ea.plans AND
          to_date(p1051.begda, "yyyy-MM-dd") <= ea.fecha AND
          to_date(p1051.endda, "yyyy-MM-dd") >= ea.fecha
),
pa0004 as (
select distinct
    p1051.begda,
    p1051.endda,
    p1051.bukrs,
    p1051.werks,
    p1051.btrtl,
    p1051.stell,
    p1051.plans,
    p1051.kokrs,
    p1051.kostl,
    p1051.trfar,
    p1051.fecha,
    p1051.anio,
    p1051.mes,
    p1051.nro_pers,
    p1051.nomb_pers,
    p1051.zona,
    p1051.cod_un_org,
    p1051.grado_hay,
    CASE WHEN pa0004.sbgru IS NOT NULL THEN 'SI' ELSE 'NO' END  AS condicion
from p1051 p1051
LEFT JOIN db_koandina_regional_stage.hrpa0004_stagesec pa0004
       ON pa0004.pernr = p1051.pernr AND
          to_date(pa0004.endda, "yyyy-MM-dd") >= p1051.fecha AND
          to_date(pa0004.begda, "yyyy-MM-dd") <= p1051.fecha
),
pa0041 as (
select distinct
    pa0004.begda,
    pa0004.endda,
    pa0004.bukrs,
    pa0004.werks,
    pa0004.btrtl,
    pa0004.stell,
    pa0004.plans,
    pa0004.kokrs,
    pa0004.kostl,
    pa0004.trfar,
    pa0004.fecha,
    pa0004.anio,
    pa0004.mes,
    pa0004.nro_pers,
    pa0004.nomb_pers,
    pa0004.zona,
    pa0004.cod_un_org,
    pa0004.grado_hay,
    pa0004.condicion,
    pa0041.dat01                                                AS fech_ing
from pa0004 pa0004
LEFT JOIN db_koandina_regional_stage.HRPA0041_stagesec pa0041
       ON pa0041.pernr = pa0004.pernr AND
          to_date(pa0041.endda, "yyyy-MM-dd") >= pa0004.fecha AND
          to_date(pa0041.begda, "yyyy-MM-dd") <= pa0004.fecha
),
pos as (
select distinct
    pa0041.begda,
    pa0041.endda,
    pa0041.bukrs,
    pa0041.werks,
    pa0041.btrtl,
    pa0041.stell,
    pa0041.plans,
    pa0041.kokrs,
    pa0041.kostl,
    pa0041.trfar,
    pa0041.fecha,
    pa0041.anio,
    pa0041.mes,
    pa0041.nro_pers,
    pa0041.nomb_pers,
    pa0041.zona,
    pa0041.cod_un_org,
    pa0041.grado_hay,
    pa0041.condicion,
    pa0041.fech_ing,
    pos.txtmd                                                   AS cargo
from pa0041 pa0041
LEFT JOIN db_koandina_regional_stage.hrposition_text_stage pos
       ON pos.key1 = pa0041.plans AND
          pos.langu = pa0002.sprsl AND
          to_date(pos.dateto, "yyyy-MM-dd") >= pa0041.fecha AND
          to_date(pos.datefrom, "yyyy-MM-dd") <= pa0041.fecha
),
pa0002 AS (
    select distinct
        pernr,
        sprsl,
        natio,
        gesch,
        max(gbdat) as gbdat
    from db_koandina_regional_stage.HRPA0002_stagesec pa0002
    group by
        pernr,
        sprsl,
        natio,
        gesch
),

idioma as (
select distinct
   pos.begda,
   pos.endda,
   pos.bukrs,
   pos.werks,
   pos.btrtl,
   pos.stell,
   pos.plans,
   pos.kokrs,
   pos.kostl,
   pos.trfar,
   pos.fecha,
   pos.anio,
   pos.mes,
   pos.nro_pers,
   pos.nomb_pers,
   pos.zona,
   pos.cod_un_org,
   pos.grado_hay,
   pos.condicion,
   pos.fech_ing,
   pos.cargo,
   pa0002.sprsl                                                AS idioma,
   pa0002.gbdat                                                AS fech_nac
from pos pos
LEFT JOIN pa0002 pa0002
      ON pos.pernr = pa0002.pernr AND
          pa0002.sprsl = 'S'
),

ccos as (
select distinct
   idioma.begda,
   idioma.endda,
   idioma.bukrs,
   idioma.werks,
   idioma.btrtl,
   idioma.stell,
   idioma.plans,
   idioma.kokrs,
   idioma.kostl,
   idioma.trfar,
   idioma.fecha,
   idioma.anio,
   idioma.mes,
   idioma.nro_pers,
   idioma.nomb_pers,
   idioma.zona,
   idioma.cod_un_org,
   idioma.grado_hay,
   idioma.condicion,
   idioma.fech_ing,
   idioma.cargo,
   idioma.idioma,
   idioma.fech_nac,
   ccos.txtmd                                                  AS centro_costo
from idioma idioma
LEFT JOIN db_koandina_regional_stage.costcenter_text_stage ccos
       ON ccos.kokrs = idioma.kokrs AND
          ccos.kostl = idioma.kostl AND
          ccos.langu = idioma.idioma AND
          ccos.dateto >= idioma.fecha AND
          ccos.datefrom <= idioma.fecha
),
email AS (
    select distinct
        pa0105.usrid_long,
        pa0105.pernr,
        pa0105.begda,
        pa0105.endda
    from db_koandina_regional_stage.HRPA0105_stagesec pa0105
    where pa0105.usrty = '0010'
),
mail as (
select distinct
   ccos.begda,
   ccos.endda,
   ccos.bukrs,
   ccos.werks,
   ccos.btrtl,
   ccos.stell,
   ccos.plans,
   ccos.kokrs,
   ccos.kostl,
   ccos.trfar,
   ccos.fecha,
   ccos.anio,
   ccos.mes,
   ccos.nro_pers,
   ccos.nomb_pers,
   ccos.zona,
   ccos.cod_un_org,
   ccos.grado_hay,
   ccos.condicion,
   ccos.fech_ing,
   ccos.cargo,
   ccos.idioma,
   ccos.fech_nac,
   ccos.centro_costo,
   pa0105.usrid_long                                           AS mail
from ccos ccos
LEFT JOIN email email
       ON email.pernr = ccos.pernr AND
          to_date(email.begda, "yyyy-MM-dd") <= ccos.fecha AND
          to_date(email.endda, "yyyy-MM-dd") >= ccos.fecha
),

org as (
select distinct
   mail.begda,
   mail.endda,
   mail.bukrs,
   mail.werks,
   mail.btrtl,
   mail.stell,
   mail.plans,
   mail.kokrs,
   mail.kostl,
   mail.trfar,
   mail.fecha,
   mail.anio,
   mail.mes,
   mail.nro_pers,
   mail.nomb_pers,
   mail.zona,
   mail.cod_un_org,
   mail.grado_hay,
   mail.condicion,
   mail.fech_ing,
   mail.cargo,
   mail.idioma,
   mail.fech_nac,
   mail.centro_costo,
   mail.mail,
   org.txtmd                                                   AS desc_un_org
from mail mail
LEFT JOIN db_koandina_regional_stage.hrorgunittext_stage org
       ON org.key1 = ccos.orgeh AND
           to_date(org.datefrom, "yyyy-MM-dd") <= ccos.fecha AND
           to_date(org.dateto, "yyyy-MM-dd") >= ccos.fecha
),
-------------------------------------
rota1 AS (
    select trfar, stell,  rotacion
    from db_koandina_cl_stage.hrt024_stagesec
    where stell = '00000000'
),
rota2 AS (
    select distinct trfar, stell,  rotacion
    from db_koandina_cl_stage.hrt024_stagesec
    where stell != '00000000'
),
rol1 AS (
    select trfar, stell,  rol
    from db_koandina_cl_stage.hrt024_stagesec
    where stell = '00000000'
),
rol2 AS (
    select distinct trfar, stell,  rol
    from db_koandina_cl_stage.hrt024_stagesec
    where stell != '00000000'
),

t23 as (
    select
        kostl,
        trfar,
        gerencia1,
        gerencia2,
        gerencia_om,
        rg_tiempos,
        analista,
        comentario
    from db_koandina_cl_stage.hrt023_stagesec t23
    where  t23.trfar != ''
),
t23null as (
    select
        kostl,
        trfar,
        gerencia1,
        gerencia2,
        gerencia_om,
        rg_tiempos,
        analista,
        comentario
    from db_koandina_cl_stage.hrt023_stagesec t23
    where t23.trfar = ''
)
------------------------------------
SELECT DISTINCT
    org.anio,
    org.mes,
    org.nro_pers,
    org.nomb_pers,
    cct.key1                                                    AS cod_sociedad,
    cct.txtmd                                                   AS sociedad,
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
    org.zona,
    CASE WHEN ea.kostl = t23.kostl AND ea.trfar = t23.trfar
            THEN t23.gerencia1
         WHEN ea.kostl = t23null.kostl
            THEN t23null.gerencia1
    END                                                         AS gerencia_1,
    CASE WHEN ea.kostl = t23.kostl AND ea.trfar = t23.trfar
            THEN t23.gerencia2
         WHEN ea.kostl = t23null.kostl
            THEN t23null.gerencia2
    END                                                         AS gerencia_2,
    org.cod_un_org,
    org.desc_un_org,
    org.grado_hay,
    coalesce(rota2.rotacion,rota1.rotacion)                     AS rotacion,
    coalesce(rol2.rol,rol1.rol)                                 AS rol,
    gen.txtlg                                                   AS genero,
    t005t.natio                                                 AS nacionalidad,
    org.condicion,
    org.fech_ing,
    org.fech_nac,
    org.cargo,
    org.centro_costo,
    CASE WHEN (org.bukrs = '3043' OR org.bukrs = '3044')
            THEN org.kostl
         WHEN (org.bukrs = '3045' OR org.bukrs = '3050')
            THEN con.orige
    END                                                         AS cen_cost_imp,
    org.idioma,
    org.mail,
    org.anio || '-' || org.mes ||                                 as dt_month
--    ea.anio || '-' || ea.mes || '-' || ea.dia                   AS dt
-- V2
FROM org org
LEFT JOIN db_koandina_regional_stage.comp_code_text_stage cct
       ON org.bukrs = cct.key1
LEFT JOIN db_koandina_regional_stage.hrpers_sarea_2_text_stage pstt
       ON org.btrtl = pstt.btrtl AND
          org.werks = pstt.werks
LEFT JOIN t23 t23
       ON org.kostl = t23.kostl
LEFT JOIN t23null t23null
       ON org.kostl = t23null.kostl
LEFT JOIN rota1 rota1
       ON rota1.trfar = org.trfar AND
          rota1.stell = '00000000'
LEFT JOIN rota2 rota2
       ON rota2.trfar = org.trfar AND
          rota2.stell = org.stell
LEFT JOIN rol1 rol1
       ON rol1.trfar = org.trfar AND
          rol1.stell = '00000000'
LEFT JOIN rol2 rol2
       ON rol2.trfar = org.trfar AND
          rol2.stell = org.stell
LEFT JOIN db_koandina_regional_stage.hrgender2text_stage gen
       ON gen.key1 = pa0002.gesch AND
          gen.langu = pa0002.sprsl
LEFT JOIN db_koandina_regional_stage.hrt005t_stagesec t005t
       ON t005t.land1 = pa0002.natio AND
          t005t.spras = pa0002.sprsl
LEFT JOIN db_koandina_cl_stage.hrconve_stagesec con
       ON con.desti = org.kostl
