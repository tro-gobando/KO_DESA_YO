WITH
tie as (
    select
        max(fecha) as fecha,
        anio,
        mes
    from db_koandina_regional_stage.dim_tiempo_stage tie
    where
        anio between year(current_date)-2 and year(current_date)
--        anio <= year(current_date)
    group by anio, mes
),
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
           tie.fecha,
           tie.anio,
           tie.mes
    FROM db_koandina_regional_analyticssec.employee_attr_analyticssec ea
    LEFT JOIN tie tie
              ON tie.fecha BETWEEN to_date(ea.begda, "yyyy-MM-dd") AND
                 CASE WHEN to_date(ea.endda, "yyyy-MM-dd") > current_date THEN current_date ELSE to_date(ea.endda, "yyyy-MM-dd") END
    where
        stat2 = '3' and
        year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
),
pa0002 AS (
    select distinct
        pernr,
        sprsl,
        natio,
        gesch,
        max(gbdat) as gbdat
    from db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
    where trim(sprsl) != ''
    group by
        pernr,
        sprsl,
        natio,
        gesch
),
p1051 AS (
    select distinct
        p1051.jcode,
        p1051.objid,
        tie.fecha
    from db_koandina_regional_analyticssec.hrp1051_analyticssec p1051
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN to_date(p1051.begda, "yyyy-MM-dd") AND
                               CASE WHEN to_date(p1051.endda, "yyyy-MM-dd") > current_date THEN current_date
                                    ELSE to_date(p1051.endda, "yyyy-MM-dd")
                               END
    WHERE p1051.plvar = '01' AND
        p1051.otype = 'S'  AND
        p1051.subty = 'HAY' AND
        year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
),
pa0004 as (
    select distinct
        pa0004.pernr,
        pa0004.sbgru,
        tie.fecha
    from db_koandina_regional_analyticssec.hrpa0004_analyticssec pa0004
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN to_date(pa0004.begda, "yyyy-MM-dd") AND
                               CASE WHEN to_date(pa0004.endda, "yyyy-MM-dd") > current_date THEN current_date
                                    ELSE to_date(pa0004.endda, "yyyy-MM-dd")
                               END
    where year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
),
pa0041 AS (
    select distinct
        pa0041.pernr,
        pa0041.dat01,
        tie.fecha
    from db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN to_date(pa0041.begda, "yyyy-MM-dd") AND
                               CASE WHEN to_date(pa0041.endda, "yyyy-MM-dd") > current_date THEN current_date
                                    ELSE to_date(pa0041.endda, "yyyy-MM-dd")
                               END
    where year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
),
posicion AS (
    select distinct
        pos.txtmd,
        pos.key1,
        pos.langu,
        tie.fecha
    from db_koandina_regional_analytics.hrposition_text_analytics pos
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN to_date(pos.datefrom, "yyyy-MM-dd") AND
                               CASE WHEN to_date(pos.dateto, "yyyy-MM-dd") > current_date THEN current_date
                                    ELSE to_date(pos.dateto, "yyyy-MM-dd")
                               END
    where year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
),
ocacional_paraguay AS (
    select distinct
        'OCACIONAL' as txtmd
        ,pos_paraguay.key1
    from db_koandina_regional_analytics.hrposition_text_analytics pos_paraguay
    where
    pos_paraguay.langu = 'S'
    and pos_paraguay.txtmd in ('AUXILIAR DE SUCURSAL TEMP',
                               'CONTROL EXPEDICION TEMPOR',
                               'DIGITADOR EXPEDICION TEMP',
                               'DIGITADOR TEMPORADA',
                               'OPER.TEMPORA',
                               'OPERADOR GRUA TEMPORADA',
                               'OPERADOR TEMPORADA',
                               'OPERARIO DE TEMPORADA',
                               'OPERARIO TEMPORADA',
                               'Operario Calificado de Temporada',
                               'Operario Interno De Temporada',
                               'Personal de Temporada')
),
pasante_paraguay AS (
    select distinct
        'PASANTE' as txtmd
        ,pos_paraguay.key1
    from db_koandina_regional_analytics.hrposition_text_analytics pos_paraguay
    where
    pos_paraguay.langu = 'S'
    and pos_paraguay.txtmd in ('ALUMNO EN PRACTICA',
                               'ALUMNO EN PRACTICA ADMIN VENTA',
                               'ALUMNO EN PRACTICA AND',
                               'ALUMNO EN PRACTICA ASEG DE CALIDAD',
                               'ALUMNO EN PRACTICA GERENCIA HR',
                               'ALUMNO EN PRACTICA LLENADO',
                               'ALUMNO EN PRACTICA LOGISTICA TPOLAR',
                               'ALUMNO EN PRACTICA MANTENCION',
                               'ESTUDIANTE EN PRACTICA',
                               'Operario Practico',
                               'PASANTE',
                               'PASANTE TRADE MARKETING',
                               'PRACTICA',
                               'PRACTICA AND ABASTECIMIENTO',
                               'PRACTICA AND ADMINISTRACION Y FINANZAS',
                               'PRACTICA AND CAC CV',
                               'PRACTICA AND CALIDAD',
                               'PRACTICA AND CARLOS VALDOVINOS CAC',
                               'PRACTICA AND CISMA ANTOFAGASTA',
                               'PRACTICA AND CISMA ANTOFAGASTA 2',
                               'PRACTICA AND COMERCIAL CV',
                               'PRACTICA AND COMERCIAL SN ANTONIO',
                               'PRACTICA AND CONTABILIDAD',
                               'PRACTICA AND COQ',
                               'PRACTICA AND CTRL GESTION',
                               'PRACTICA AND CUENTAS POR PAGAR',
                               'PRACTICA AND DISTRIBUCION',
                               'PRACTICA AND GER INDUSTRIAL',
                               'PRACTICA AND GERENCIA PROYECTOS',
                               'PRACTICA AND MANTENIMIENTO',
                               'PRACTICA AND MARCKETING',
                               'PRACTICA AND MARKETING',
                               'PRACTICA AND OPERACIONES',
                               'PRACTICA AND PROCESOS RRHH',
                               'PRACTICA AND RANCAGUA',
                               'PRACTICA AND REMUNERACIONES',
                               'PRACTICA AND RENCA',
                               'PRACTICA AND RENCA COOR',
                               'PRACTICA AND S&OP',
                               'PRACTICA AND TALLER MANTENIMIENTO',
                               'PRACTICA AND TERCEROS',
                               'PRACTICA MULTIVENDIG RENCA',
                               'PRACTICA TAR CD CARLOS VALDOVINOS',
                               'PRACTICA TAR CD PUENTE ALTO',
                               'PRACTICA TAR CD PUENTE ALTO DISTRI',
                               'PRACTICA TAR CD PUENTE ALTO DISTRIBUCION',
                               'PRACTICA TAR CD RENCA ED1',
                               'PRACTICA TAR CD SAN ANTONIO',
                               'PRACTICA TAR CONTROL GESTION',
                               'PRACTICA TAR DISTRIBUCION CV',
                               'PRACTICA TAR DISTRIBUCION PA',
                               'PRACTICA TAR DISTRIBUCION RENCA',
                               'PRACTICA TAR EDIFICIO RENCA',
                               'PRACTICA TAR MAIPU',
                               'PRACTICA TAR RANCAGUA',
                               'Pasante',
                               'Pasante Talento y Desarrollo',
                               'pasante')
),
ccosto as (
    select distinct
        ccos.txtmd,
        ccos.kokrs,
        ccos.kostl,
        ccos.langu,
        tie.fecha
    from db_koandina_regional_analytics.costcenter_text_analytics ccos
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN ccos.datefrom AND
                               CASE WHEN ccos.dateto > current_date THEN current_date
                                    ELSE ccos.dateto
                               END
    where year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
),
pa0105 AS (
    SELECT DISTINCT
        pa0105.pernr,
        pa0105.usrid_long,
        tie.fecha
    FROM db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN to_date(pa0105.begda, "yyyy-MM-dd") AND
                               CASE WHEN to_date(pa0105.endda, "yyyy-MM-dd") > current_date THEN current_date
                                    ELSE to_date(pa0105.endda, "yyyy-MM-dd")
                               END
    WHERE pa0105.usrty = '0010' AND
          year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date AND
          trim(pa0105.usrid_long) !=''
),
organizacion as (
    select distinct
        org.key1,
        org.txtmd,
        tie.fecha
    from db_koandina_regional_analytics.hrorgunittext_analytics org
    LEFT JOIN tie tie
          ON tie.fecha BETWEEN to_date(org.datefrom, "yyyy-MM-dd") AND
                               CASE WHEN to_date(org.dateto, "yyyy-MM-dd") > current_date THEN current_date
                                    ELSE to_date(org.dateto, "yyyy-MM-dd")
                               END
    where year(tie.fecha) >= year(current_date)-2 and tie.fecha <= current_date
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
    from db_koandina_cl_analyticssec.hrt023_analyticssec t23
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
    from db_koandina_cl_analyticssec.hrt023_analyticssec t23
    where t23.trfar = ''
)

SELECT DISTINCT

    ea.pernr                                                    AS nro_pers,
    ea.sname                                                    AS nomb_pers,
    ea.bukrs                                                    AS cod_sociedad,
    cct.txtmd                                                   AS sociedad,
    CASE WHEN ea.bukrs = '3046' or ea.bukrs = '3047'
            THEN 'Argentina'
         WHEN ea.bukrs = '3048'
            THEN 'Brasil'
         WHEN ea.bukrs = '3043' or ea.bukrs = '3044' or ea.bukrs = '3045' or ea.bukrs = '3050'
            THEN 'Chile'
         WHEN ea.bukrs = '3049'
            THEN 'Paraguay'
        --  ELSE 'Otro'
    END                                                         AS operacion,
    pstt.txtsh                                                  AS localidad,
    CASE WHEN ea.werks = '8C1F' OR ea.werks = '8C2F'
            THEN 'Antofagasta'
         WHEN ea.werks  = '8C1Q' OR ea.werks  = '8C2Q'
            THEN 'Coquimbo'
         WHEN ea.werks  = '8C1G' OR ea.werks  = '8C2G'
            THEN 'Punta Arenas'
         ELSE 'Centro'
    END                                                         AS zona,
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
    ea.orgeh                                                    AS cod_un_org,
    org.txtmd                                                   AS desc_un_org,
    p1051.jcode                                                 AS grado_hay,
    coalesce(rota2.rotacion,rota1.rotacion)                     AS rotacion,
    coalesce(rol2.rol,rol1.rol)                                 AS rol,
    gen.txtlg                                                   AS genero,
    t005t.natio                                                 AS nacionalidad,
    CASE WHEN pa0004.sbgru IS NOT NULL THEN 'SI' ELSE 'NO' END  AS condicion,
    pa0041.dat01                                                AS fech_ing,
    pa0002.gbdat                                                AS fech_nac,
    CASE  WHEN ea.bukrs = '3049' and ea.persk = '8E' THEN coalesce(coalesce(oca_p.txtmd,pas_p.txtmd),pos.txtmd)
    ELSE pos.txtmd      ----- PLANTA
    END                                                         AS cargo,
--    pos.txtmd                                                   AS cargo,
    ccos.txtmd                                                  AS centro_costo,
    CASE WHEN (ea.bukrs = '3043' OR ea.bukrs = '3044')
            THEN ea.kostl
         WHEN (ea.bukrs = '3045' OR ea.bukrs = '3050')
            THEN con.orige
        ELSE
            ea.kostl
    END                                                         AS cen_cost_imp,
    pa0002.sprsl                                                AS idioma,
    pa0105.usrid_long                                           AS mail,
-- --    ea.anio || '-' || ea.mes ||                                 as dt_month
-- --    ea.anio || '-' || ea.mes || '-' || ea.dia                   AS dt
-- -- V3
    ea.anio                                                     AS anio,
    ea.mes                                                      AS mes
FROM employee_attr ea
LEFT JOIN db_koandina_regional_analytics.comp_code_text_analytics cct
       ON ea.bukrs = cct.key1
LEFT JOIN db_koandina_regional_analytics.hrpers_sarea_2_text_analytics pstt
       ON ea.btrtl = pstt.btrtl AND
          ea.werks = pstt.werks
LEFT JOIN t23 t23
       ON ea.kostl = t23.kostl
LEFT JOIN t23null t23null
       ON ea.kostl = t23null.kostl
LEFT JOIN organizacion org
       ON org.key1 = ea.orgeh AND
          org.fecha = ea.fecha
LEFT JOIN p1051 p1051
       ON p1051.objid = ea.plans AND
          p1051.fecha = ea.fecha
LEFT JOIN rota1 rota1
       ON rota1.trfar = ea.trfar AND
          rota1.stell = '00000000'
LEFT JOIN rota2 rota2
       ON rota2.trfar = ea.trfar AND
          rota2.stell = ea.stell
LEFT JOIN rol1 rol1
       ON rol1.trfar = ea.trfar AND
          rol1.stell = '00000000'
LEFT JOIN rol2 rol2
       ON rol2.trfar = ea.trfar AND
          rol2.stell = ea.stell
LEFT JOIN pa0002 pa0002
      ON ea.pernr = pa0002.pernr
         AND (pa0002.sprsl = 'S' or pa0002.sprsl = 'P')
LEFT JOIN db_koandina_regional_analytics.hrgender2text_analytics gen
      ON gen.key1 = pa0002.gesch AND
          gen.langu = pa0002.sprsl
LEFT JOIN db_koandina_regional_analyticssec.hrt005t_analyticssec t005t
      ON t005t.land1 = pa0002.natio AND
          t005t.spras = pa0002.sprsl
LEFT JOIN pa0004 pa0004
       ON pa0004.pernr = ea.pernr AND
          pa0004.fecha = ea.fecha
LEFT JOIN pa0041 pa0041
       ON pa0041.pernr = ea.pernr AND
          pa0041.fecha = ea.fecha
LEFT JOIN posicion pos
      ON pos.key1 = ea.plans AND
          pos.langu = pa0002.sprsl AND
          pos.fecha = ea.fecha
left join pasante_paraguay pas_p ON pas_p.key1 = ea.plans
left join ocacional_paraguay oca_p ON oca_p.key1 = ea.plans
LEFT JOIN ccosto ccos
       ON ccos.kokrs = ea.kokrs AND
          ccos.kostl = ea.kostl AND
          ccos.langu = pa0002.sprsl AND
          ccos.fecha = ea.fecha
LEFT JOIN db_koandina_cl_analyticssec.hrconve_analyticssec con
       ON con.desti = ea.kostl
LEFT JOIN pa0105 pa0105
       ON pa0105.pernr = ea.pernr AND
          pa0105.fecha = ea.fecha
