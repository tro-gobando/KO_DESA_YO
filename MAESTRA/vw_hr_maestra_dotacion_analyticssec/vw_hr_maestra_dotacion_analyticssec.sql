--CREATE OR REPLACE VIEW db_koandina_regional_analyticssec.vw_hr_maestra_dotacion_analyticssec AS 
WITH
  tie AS (
  SELECT
    tie.fecha
  , tie.anio
  , tie.mes
  -- , max_dia_mes.ult_dia_mes
  FROM
      db_koandina_regional_analytics.dim_tiempo_analytics tie
  -- LEFT JOIN (
			 -- SELECT
			    -- MAX(fecha) ult_dia_mes
			   -- , anio
			   -- , mes
			  -- FROM
				-- db_koandina_regional_analytics.dim_tiempo_analytics
			  -- WHERE   anio BETWEEN year(current_date) - 2 AND year(current_date)
			  -- GROUP BY anio, mes
	        -- )  max_dia_mes ON ((max_dia_mes.mes = tie.mes) AND (max_dia_mes.anio = tie.anio))
  WHERE   tie.anio BETWEEN year(current_date) - 2 AND year(current_date)
) 

, employee_attr_act AS (
  SELECT
    ea.begda
  , ea.endda
  , ea.pernr
  , ea.bukrs
  , ea.werks
  , ea.btrtl
  , ea.orgeh
  , ea.stell
  , ea.plans
  , ea.kokrs
  , ea.kostl
  , ea.abkrs
  , ea.trfar
  , ea.sname
  , ea.persk
  , tie.fecha
  , tie.anio
  , tie.mes
  -- , tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.employee_attr_analyticssec ea
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(ea.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(ea.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(ea.endda, '%Y-%m-%d') END)
  WHERE   
	 stat2 = '3' 
-- 	 AND year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
)

, employee_attr_inact AS (
  SELECT
    ea.begda
  , ea.endda
  , ea.pernr
  , ea.bukrs
  , ea.werks
  , ea.btrtl
  , ea.orgeh
  , ea.stell
  , ea.plans
  , ea.kokrs
  , ea.kostl
  , ea.abkrs
  , ea.trfar
  , ea.sname
  , ea.persk
  , tie.fecha
  , tie.anio
  , tie.mes
  FROM
     db_koandina_regional_analyticssec.employee_attr_analyticssec ea
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(ea.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(ea.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(ea.endda, '%Y-%m-%d') END)
  WHERE   
	 stat2 != '3' 
-- 	 AND year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
)

-- pa0002 AS (
  -- SELECT DISTINCT
     -- pernr
  -- , sprsl
  -- , natio
  -- , gesch
  -- , "max"(gbdat) gbdat
  -- , fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0002.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0002.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0002.endda, '%Y-%m-%d') END)))
  -- WHERE   (((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date)) AND (trim(sprsl) <> ''))
  -- GROUP BY pernr, sprsl, natio, gesch, fecha
-- ) 
, pa0002_tie AS (
  SELECT DISTINCT
    pa0002.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pa0002.endda) endda, min(pa0002.begda) begda
  FROM
     db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0002.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(pa0002.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0002.endda, '%Y-%m-%d') END)
  WHERE   
--   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date AND 
    trim(sprsl) <> ''
  GROUP BY pa0002.pernr, mes, anio
) 

, pa0002 AS (
  SELECT 
    at.fecha
  , pa0002.pernr
  , pa0002.sprsl
  , pa0002.natio
  , pa0002.gesch
  , "max"(pa0002.gbdat) gbdat
  FROM pa0002_tie at
  LEFT JOIN db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
        ON pa0002.pernr = at.pernr AND pa0002.endda = at.endda and pa0002.begda = at.begda
  WHERE pa0002.sprsl = 'S' OR pa0002.sprsl = 'P' 
  GROUP BY pa0002.pernr, pa0002.sprsl, pa0002.natio, pa0002.gesch, at.fecha
)

-- , p1051 AS (
  -- SELECT DISTINCT
     -- p1051.jcode
  -- , p1051.objid
  -- , p1051.subty
  -- , tie.fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.hrp1051_analyticssec p1051
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(p1051.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(p1051.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(p1051.endda, '%Y-%m-%d') END)))
-- --   WHERE   (((((p1051.plvar = '01') AND (p1051.otype = 'S')) AND (p1051.subty = 'HAY')) AND (year(tie.fecha) >= (year(current_date) - 2))) AND (tie.fecha <= current_date))
  -- WHERE   (p1051.plvar = '01'
         -- AND p1051.otype = 'S' 
		 -- AND p1051.subty in ('HAY','HAYP') 
		 -- AND year(tie.fecha) >= year(current_date) - 2
		 -- AND tie.fecha <= current_date) 		--se agrega grado hay para paraguay dic-22							   
-- ) 
, p1051_tie AS (
  SELECT 
    p1051.objid, p1051.jcode, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(p1051.endda) endda, min(p1051.begda) begda
  FROM
     db_koandina_regional_analyticssec.hrp1051_analyticssec p1051
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(p1051.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(p1051.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(p1051.endda, '%Y-%m-%d') END)
--   WHERE year(tie.fecha) >= year(current_date) - 2 AND  tie.fecha <= current_date
  GROUP BY  p1051.objid, p1051.jcode, tie.mes ,tie.anio
)

, p1051 AS (
  SELECT DISTINCT
    at.fecha
  , p1051.jcode
  , p1051.objid
  , p1051.subty
--   , at.fecha
  FROM p1051_tie at
  LEFT JOIN db_koandina_regional_analyticssec.hrp1051_analyticssec p1051 ON  p1051.objid =  at.objid AND  p1051.jcode =at.jcode AND p1051.endda = at.endda and p1051.begda = at.begda
--   WHERE   (((((p1051.plvar = '01') AND (p1051.otype = 'S')) AND (p1051.subty = 'HAY')) AND (year(tie.fecha) >= (year(current_date) - 2))) AND (tie.fecha <= current_date))
  WHERE p1051.plvar = '01'
     AND p1051.otype = 'S' 
     AND p1051.subty in ('HAY','HAYP') 
    --  AND year(at.fecha) >= year(current_date) - 2 AND at.fecha <= current_date    --se agrega grado hay para paraguay dic-22  
)

-- , pa0004 AS (
  -- SELECT DISTINCT
     -- pa0004.pernr
  -- , pa0004.sbgru
  -- , tie.fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.hrpa0004_analyticssec pa0004
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0004.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0004.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0004.endda, '%Y-%m-%d') END)))
  -- WHERE   ((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date))
-- ) 
, pa0004_tie AS (
  SELECT DISTINCT
    pa0004.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pa0004.endda) endda, min(pa0004.begda) begda
  FROM
     db_koandina_regional_analyticssec.hrpa0004_analyticssec pa0004
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0004.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(pa0004.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0004.endda, '%Y-%m-%d') END)
--   WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY pa0004.pernr, mes, anio
) 

, pa0004 AS (
  SELECT DISTINCT
    pa0004.pernr
  , pa0004.sbgru
  , at.fecha
  FROM pa0004_tie at
  LEFT JOIN db_koandina_regional_analyticssec.hrpa0004_analyticssec pa0004
        ON pa0004.pernr = at.pernr AND pa0004.endda = at.endda and pa0004.begda = at.begda
)

-- , pa0041 AS (
  -- SELECT DISTINCT
     -- pa0041.pernr
  -- , pa0041.dat01
  -- , tie.fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0041.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0041.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0041.endda, '%Y-%m-%d') END)))
  -- WHERE   ((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date))
-- ) 
-- ,pa0041_tie AS (
--   SELECT DISTINCT
--     pa0041.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio
--   FROM
--      (db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
--   LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0041.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0041.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0041.endda, '%Y-%m-%d') END)))
--   WHERE   year(tie.fecha) >= (year(current_date) - 2) AND (tie.fecha <= current_date)
--   GROUP BY pa0041.pernr, mes, anio
-- ) 

-- , pa0041 AS (
--   SELECT DISTINCT
--      pa0041.pernr
--   , pa0041.dat01
--   , at.fecha
--   FROM pa0041_tie at
-- LEFT JOIN db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
--  ON pa0041.pernr = at.pernr
-- ) 

, pa0041 AS (
  SELECT DISTINCT
    pa0041.pernr, MAX(tie.fecha) fecha, MAX(pa0041.dat01) dat01, tie.mes , tie.anio, min(pa0041.begda) begda
  FROM
     db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0041.begda, '%Y-%m-%d') AND CASE WHEN date_parse(pa0041.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0041.endda, '%Y-%m-%d') END
--   WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date --and pa0041.begda = at.begda
            --   AND pa0041.pernr = '06000001'
  GROUP BY pa0041.pernr, mes, anio
                -- order by tie.anio, tie.mes
)

-- , posicion AS (
  -- SELECT DISTINCT
     -- pos.txtmd
  -- , pos.key1
  -- , pos.langu
  -- , tie.fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.hrpositiontext_analyticssec pos
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pos.datefrom, '%Y-%m-%d') AND (CASE WHEN (date_parse(pos.dateto, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pos.dateto, '%Y-%m-%d') END)))
  -- WHERE   ((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date))
-- ) 

,pos_tie AS (
  SELECT DISTINCT
    pos.key1, pos.langu, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pos.dateto) dateto, min(pos.datefrom) datefrom
  FROM
     db_koandina_regional_analyticssec.hrpositiontext_analyticssec pos
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pos.datefrom, '%Y-%m-%d') AND CASE WHEN date_parse(pos.dateto, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pos.dateto, '%Y-%m-%d') END
--   WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY pos.key1,pos.langu,  mes, anio
) 
, posicion AS (
  SELECT DISTINCT
    pos.txtmd
  , pos.key1
  , pos.langu
  , at.fecha
  FROM pos_tie at
  LEFT JOIN db_koandina_regional_analyticssec.hrpositiontext_analyticssec pos
	    ON pos.key1 = at.key1 AND pos.langu = at.langu AND pos.dateto = at.dateto and pos.datefrom = at.datefrom
)

, ocacional_paraguay AS (
  SELECT DISTINCT
  'OCACIONAL' txtmd
  , pos_paraguay.key1
  FROM
     db_koandina_regional_analyticssec.hrpositiontext_analyticssec pos_paraguay
  WHERE   pos_paraguay.langu = 'S' AND pos_paraguay.txtmd IN ( 'AUXILIAR DE SUCURSAL TEMP', 'CONTROL EXPEDICION TEMPOR', 'DIGITADOR EXPEDICION TEMP'
															 , 'DIGITADOR TEMPORADA', 'OPER.TEMPORA', 'OPERADOR GRUA TEMPORADA', 'OPERADOR TEMPORADA'
															 , 'OPERARIO DE TEMPORADA', 'OPERARIO TEMPORADA', 'Operario Calificado de Temporada'
															 , 'Operario Interno De Temporada', 'Personal de Temporada')
) 

, pasante_paraguay AS (
  SELECT DISTINCT
     'PASANTE' txtmd
  , pos_paraguay.key1
  FROM
     db_koandina_regional_analyticssec.hrpositiontext_analyticssec pos_paraguay
  WHERE   ((pos_paraguay.langu = 'S') AND (pos_paraguay.txtmd IN ( 'ALUMNO EN PRACTICA', 'ALUMNO EN PRACTICA ADMIN VENTA', 'ALUMNO EN PRACTICA AND'
																 , 'ALUMNO EN PRACTICA ASEG DE CALIDAD', 'ALUMNO EN PRACTICA GERENCIA HR', 'ALUMNO EN PRACTICA LLENADO'
																 , 'ALUMNO EN PRACTICA LOGISTICA TPOLAR', 'ALUMNO EN PRACTICA MANTENCION', 'ESTUDIANTE EN PRACTICA'
																 , 'Operario Practico', 'PASANTE', 'PASANTE TRADE MARKETING', 'PRACTICA', 'PRACTICA AND ABASTECIMIENTO'
																 , 'PRACTICA AND ADMINISTRACION Y FINANZAS', 'PRACTICA AND CAC CV', 'PRACTICA AND CALIDAD'
																 , 'PRACTICA AND CARLOS VALDOVINOS CAC', 'PRACTICA AND CISMA ANTOFAGASTA', 'PRACTICA AND CISMA ANTOFAGASTA 2'
																 , 'PRACTICA AND COMERCIAL CV', 'PRACTICA AND COMERCIAL SN ANTONIO', 'PRACTICA AND CONTABILIDAD', 'PRACTICA AND COQ'
																 , 'PRACTICA AND CTRL GESTION', 'PRACTICA AND CUENTAS POR PAGAR', 'PRACTICA AND DISTRIBUCION', 'PRACTICA AND GER INDUSTRIAL'
																 , 'PRACTICA AND GERENCIA PROYECTOS', 'PRACTICA AND MANTENIMIENTO', 'PRACTICA AND MARCKETING', 'PRACTICA AND MARKETING'
																 , 'PRACTICA AND OPERACIONES', 'PRACTICA AND PROCESOS RRHH', 'PRACTICA AND RANCAGUA', 'PRACTICA AND REMUNERACIONES'
																 , 'PRACTICA AND RENCA', 'PRACTICA AND RENCA COOR', 'PRACTICA AND S&OP', 'PRACTICA AND TALLER MANTENIMIENTO'
																 , 'PRACTICA AND TERCEROS', 'PRACTICA MULTIVENDIG RENCA', 'PRACTICA TAR CD CARLOS VALDOVINOS', 'PRACTICA TAR CD PUENTE ALTO'
																 , 'PRACTICA TAR CD PUENTE ALTO DISTRI', 'PRACTICA TAR CD PUENTE ALTO DISTRIBUCION', 'PRACTICA TAR CD RENCA ED1'
																 , 'PRACTICA TAR CD SAN ANTONIO', 'PRACTICA TAR CONTROL GESTION', 'PRACTICA TAR DISTRIBUCION CV', 'PRACTICA TAR DISTRIBUCION PA'
																 , 'PRACTICA TAR DISTRIBUCION RENCA', 'PRACTICA TAR EDIFICIO RENCA', 'PRACTICA TAR MAIPU', 'PRACTICA TAR RANCAGUA', 'Pasante'
																 , 'Pasante Talento y Desarrollo', 'pasante')))
) 
-- , ccosto AS (
  -- SELECT DISTINCT
     -- ccos.txtmd
  -- , ccos.kokrs
  -- , ccos.kostl
  -- , ccos.langu
  -- , tie.fecha
  -- FROM
     -- (db_koandina_regional_analytics.costcenter_text_analytics ccos
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN ccos.datefrom AND (CASE WHEN (ccos.dateto > current_date) THEN current_date ELSE ccos.dateto END)))
  -- WHERE   ((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date))
-- ) 

, ccos_tie AS (
  SELECT DISTINCT
    ccos.kokrs, ccos.kostl, ccos.langu, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(ccos.dateto) dateto, min(ccos.datefrom) datefrom
  FROM
     db_koandina_regional_analytics.costcenter_text_analytics ccos
  LEFT JOIN tie tie ON (tie.fecha BETWEEN ccos.datefrom AND (CASE WHEN (ccos.dateto > current_date) THEN current_date ELSE ccos.dateto END))
--   WHERE year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY ccos.kokrs, ccos.kostl, ccos.langu, mes, anio
) 
, ccosto AS (
  SELECT DISTINCT
    ccos.txtmd
  , ccos.kokrs
  , ccos.kostl
  , ccos.langu
  , at.fecha
  FROM ccos_tie at
  LEFT JOIN db_koandina_regional_analytics.costcenter_text_analytics ccos
 ON ccos.kokrs = at.kokrs AND ccos.kostl = at.kostl AND ccos.dateto = at.dateto and ccos.datefrom = at.datefrom
)

-- , fch_pa0105 AS (
  -- SELECT
     -- "max"(pa0105.begda) begda
  -- , pa0105.pernr
  -- FROM
     -- db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105
  -- WHERE   (usrty = '0010')
  -- GROUP BY pa0105.pernr
-- ) 

-- , pa0105 AS (
  -- SELECT
     -- pa0105.pernr
  -- , pa0105.usrid_long
  -- , tie.fecha
  -- FROM
     -- ((fch_pa0105 fch
  -- INNER JOIN db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105 ON ((fch.begda = pa0105.begda) AND (fch.pernr = pa0105.pernr)))
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0105.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0105.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0105.endda, '%Y-%m-%d') END)))
  -- WHERE   ((((pa0105.usrty = '0010') AND (year(tie.fecha) >= (year(current_date) - 2))) AND (tie.fecha <= current_date)) AND (trim(pa0105.usrid_long) <> ''))
-- ) 

, pa0105_tie AS (
  SELECT DISTINCT
    pa0105.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pa0105.endda) endda, min(pa0105.begda) begda
  FROM
     db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105
    LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0105.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0105.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0105.endda, '%Y-%m-%d') END))
  WHERE   
--   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date AND 
     pa0105.usrty = '0010'
     AND pa0105.usrty = '0010' 
    --  AND year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date 
    --  AND trim(pa0105.usrid_long) <> ''
  GROUP BY pa0105.pernr, mes, anio
) 
, pa0105 AS (
  SELECT DISTINCT
     pa0105.pernr
  , pa0105.usrid_long
  , at.fecha
  FROM pa0105_tie at
LEFT JOIN db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105
 ON pa0105.pernr = at.pernr AND pa0105.endda = at.endda and pa0105.begda = at.begda
 WHERE   pa0105.usrty = '0010' AND trim(pa0105.usrid_long) <> ''
)

-- , organizacion AS (
  -- SELECT DISTINCT
     -- org.key1
  -- , org.txtmd
  -- , tie.fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.hrorgunittext_analyticssec org
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(org.datefrom, '%Y-%m-%d') AND (CASE WHEN (date_parse(org.dateto, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(org.dateto, '%Y-%m-%d') END)))
  -- WHERE   ((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date))
-- ) 
, org_tie AS (
  SELECT DISTINCT
    org.key1, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(org.dateto) dateto, min(org.datefrom) datefrom
  FROM
     (db_koandina_regional_analyticssec.hrorgunittext_analyticssec org
  LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(org.datefrom, '%Y-%m-%d') AND (CASE WHEN (date_parse(org.dateto, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(org.dateto, '%Y-%m-%d') END)))
  WHERE   
--   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date and 
  org.datefrom = org.datefrom
  GROUP BY org.key1, mes, anio
) 

, organizacion AS (
  SELECT DISTINCT
    org.key1
  , org.txtmd
  , at.fecha
  FROM org_tie at
LEFT JOIN db_koandina_regional_analyticssec.hrorgunittext_analyticssec org
 ON org.key1 = at.key1 AND org.dateto = at.dateto and org.dateto = at.dateto
)

-- , rota1 AS (
--   SELECT
--      trfar
--   , stell
--   , rotacion
--   FROM
--      db_koandina_cl_analyticssec.hrt024_analyticssec
--   WHERE   (stell = '00000000')
-- ) 
-- , rota2 AS (
--   SELECT DISTINCT
--      trfar
--   , stell
--   , rotacion
--   FROM
--      db_koandina_cl_analyticssec.hrt024_analyticssec
--   WHERE   (stell <> '00000000')
-- ) 
-- , rota_arg AS (
  -- SELECT
     -- pernr
  -- , cttyp
  -- , fecha
  -- FROM
     -- (db_koandina_regional_analyticssec.hrpa0016_analyticssec hrpa0016
  -- LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(hrpa0016.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(hrpa0016.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(hrpa0016.endda, '%Y-%m-%d') END)))
  -- WHERE   ((year(tie.fecha) >= (year(current_date) - 2)) AND (tie.fecha <= current_date))
-- ) 

, rota_arg_tie AS (
  SELECT DISTINCT
    hrpa0016.pernr, hrpa0016.cttyp, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(hrpa0016.endda) endda, min(hrpa0016.begda) begda
  FROM
     db_koandina_regional_analyticssec.hrpa0016_analyticssec hrpa0016
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(hrpa0016.begda, '%Y-%m-%d') AND CASE WHEN date_parse(hrpa0016.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(hrpa0016.endda, '%Y-%m-%d') END
--   WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY hrpa0016.pernr, hrpa0016.cttyp, mes, anio
) 

, rota_arg AS (
  SELECT DISTINCT
    hrpa0016.pernr
  , hrpa0016.cttyp
  , at.fecha
  FROM rota_arg_tie at
LEFT JOIN db_koandina_regional_analyticssec.hrpa0016_analyticssec hrpa0016
 ON hrpa0016.pernr = at.pernr AND hrpa0016.cttyp = at.cttyp AND hrpa0016.endda = at.endda and hrpa0016.begda = at.begda
)

, rol1 AS (
  SELECT
    trfar
  , stell
  , rol
  FROM
     db_koandina_cl_analyticssec.hrt024_analyticssec
  WHERE stell = '00000000'
) 
, rol2 AS (
  SELECT DISTINCT
     trfar
  , stell
  , rol
  FROM
     db_koandina_cl_analyticssec.hrt024_analyticssec
  WHERE   (stell <> '00000000')
) 
, t23 AS (
  SELECT
     kostl
  , trfar
  , gerencia1
  , gerencia2
  , gerencia_om
  , rg_tiempos
  , analista
  , comentario
  FROM
     db_koandina_cl_analyticssec.hrt023_analyticssec t23
  WHERE   (t23.trfar <> '')
) 
, t23null AS (
  SELECT
     kostl
  , trfar
  , gerencia1
  , gerencia2
  , gerencia_om
  , rg_tiempos
  , analista
  , comentario
  FROM
     db_koandina_cl_analyticssec.hrt023_analyticssec t23
  WHERE   (t23.trfar = '')
) 
, activos AS (
  SELECT DISTINCT
     ea.pernr nro_pers
  , ea.sname nomb_pers
  , ea.bukrs cod_sociedad
  , cct.txtmd sociedad
  , CASE WHEN ea.bukrs = '3046' OR ea.bukrs = '3047' THEN 'Argentina' WHEN ea.bukrs = '3048' THEN 'Brasil' WHEN ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050' THEN 'Chile' WHEN ea.bukrs = '3049' THEN 'Paraguay' END operacion
  , pstt.txtsh localidad
  , CASE WHEN ea.werks = '8C1F' OR ea.werks = '8C2F' THEN 'Antofagasta' WHEN ea.werks = '8C1Q' OR ea.werks = '8C2Q' THEN 'Coquimbo' WHEN ea.werks = '8C1G' OR ea.werks = '8C2G' THEN 'Punta Arenas' ELSE 'Centro' END zona
  , CASE WHEN ea.kostl = t23.kostl AND ea.trfar = t23.trfar AND ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050' THEN t23.gerencia1 WHEN ea.kostl = t23null.kostl AND ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050' THEN t23null.gerencia1 ELSE null END gerencia_1
  , CASE WHEN ea.kostl = t23.kostl AND ea.trfar = t23.trfar AND ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050' THEN t23.gerencia2 WHEN ea.kostl = t23null.kostl AND ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050' THEN t23null.gerencia2 ELSE null END gerencia_2
  , ea.orgeh cod_un_org
  , org.txtmd desc_un_org
--   , p1051.jcode grado_hay
  , CASE WHEN ea.bukrs = '3049' AND p1051.subty = 'HAYP' 																	-- Paraguay
			THEN p1051.jcode
		 WHEN ea.bukrs = '3046' OR ea.bukrs = '3047' AND p1051.subty = 'HAY' 												-- Argentina
			THEN p1051.jcode
		 WHEN ea.bukrs = '3048'  AND p1051.subty = 'HAY' 																	-- Brasil
			THEN p1051.jcode
		 WHEN (ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050') AND p1051.subty = 'HAY'	-- Chile
			THEN p1051.jcode
	 END grado_hay	  
--   , (CASE WHEN ((ea.bukrs = '3049') AND (ea.persk = '8E')) THEN COALESCE(COALESCE(trim(oca_p.txtmd), trim(pas_p.txtmd)), 'PLANTA') WHEN ((ea.bukrs = '3049') AND (ea.persk <> '8E')) THEN 'PLANTA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('21', '26', '35'))) THEN 'PLANTA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('20', '52', '53'))) THEN 'TEMPORADA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('68'))) THEN 'PRACTICA' WHEN ((ea.bukrs = '3048') AND (ea.persk IN ('84', '87'))) THEN 'PRACTICA' WHEN ((ea.bukrs = '3048') AND (NOT (ea.persk IN ('84', '87')))) THEN 'PLANTA' ELSE COALESCE(trim(rota2.rotacion), trim(rota1.rotacion)) END) rotacion
  , CASE 
      WHEN ea.bukrs = '3049' AND ea.persk = '8E' THEN COALESCE(COALESCE(trim(oca_p.txtmd), trim(pas_p.txtmd)), 'PLANTA') 
      WHEN ea.bukrs = '3049' AND ea.persk <> '8E' THEN 'PLANTA' 
      WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('21', '26', '35') THEN 'PLANTA' 
      WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('30', '52', '53') THEN 'TEMPORADA' 
      WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('68') THEN 'PRACTICA' 
      WHEN ea.bukrs = '3048' AND ea.persk IN ('84', '87') THEN 'PRACTICA' 
      WHEN ea.bukrs = '3048' AND NOT(ea.persk IN ('84', '87')) THEN 'PLANTA' 
-- FALTA DEFINIR	  
-- 	  WHEN (ea.bukrs = '3049') AND
-- 	  WHEN (ea.bukrs = '3049') AND
-- 	  WHEN (ea.bukrs = '3049') AND rol_py.cttyp IN ('68') 									THEN 'PRACTICA' 

      -- ELSE COALESCE(trim(rota2.rotacion), trim(rota1.rotacion)) 
	  ELSE trim(rota.rotacion)                                              -- cambio rotacion chile
      END rotacion		--cambio de valor 20 por 30 en condicion rota_arg.cttyp
	  
--   , COALESCE(rol2.rol, rol1.rol) rol
	 ,CASE
	  WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND ea.abkrs IN ('80', '82', '84', '86')  	THEN 'ROL GENERAL' 
	  WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND ea.abkrs IN ('81', '83', '8A') 		    THEN 'ROL PROFESIONAL'
	  WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('68') 				THEN 'PRACTICA' 
	  ELSE COALESCE(rol2.rol, rol1.rol) 
 	  END rol		  --cambio de rol dic-22
  , gen.txtlg genero
  , t005t.natio nacionalidad
  , (CASE WHEN (pa0004.sbgru IS NOT NULL) THEN 'SI' ELSE 'NO' END) condicion
  , pa0041.dat01 fech_ing
  , pa0002.gbdat fech_nac
  , ea.plans cod_cargo
  , pos.txtmd cargo
  , ccos.kostl cod_centro_costo
  , ccos.txtmd centro_costo
  , (CASE WHEN ((ea.bukrs = '3043') OR (ea.bukrs = '3044')) THEN ea.kostl WHEN ((ea.bukrs = '3045') OR (ea.bukrs = '3050')) THEN con.orige ELSE ea.kostl END) cod_cen_cost_imp
  , pa0002.sprsl idioma
  , pa0105.usrid_long mail
  , rota_arg.cttyp cod_clasecontrato
  , ea.fecha
  -- , ea.ult_dia_mes
  , ea.anio anio
  , ea.mes mes
  ,ea.endda
  ,ea.persk area_de_personal
  FROM
  employee_attr_act ea
  LEFT JOIN db_koandina_regional_analytics.comp_code_text_analytics cct ON ea.bukrs = cct.key1 AND cct.txtmd is not null

                                LEFT JOIN db_koandina_regional_stage.hrperssarea2text_stagesec pstt ON ea.btrtl = pstt.btrtl AND ea.werks = pstt.werks

  LEFT JOIN t23 t23 ON ea.kostl = t23.kostl
  LEFT JOIN t23null t23null ON ea.kostl = t23null.kostl
  LEFT JOIN organizacion org ON org.key1 = ea.orgeh AND org.fecha = ea.fecha
  LEFT JOIN p1051 p1051 ON p1051.objid = ea.plans AND p1051.fecha = ea.fecha
  -- LEFT JOIN rota1 rota1 ON rota1.trfar = ea.trfar AND rota1.stell = '00000000'
  -- LEFT JOIN rota2 rota2 ON rota2.trfar = ea.trfar AND rota2.stell = ea.stell
  LEFT JOIN db_koandina_cl_analyticssec.hrt024_analyticssec rota ON rota.trfar = ea.trfar
  LEFT JOIN rol1 rol1 ON rol1.trfar = ea.trfar AND rol1.stell = '00000000'
  LEFT JOIN rol2 rol2 ON rol2.trfar = ea.trfar AND rol2.stell = ea.stell
  inner JOIN pa0002 pa0002 ON ea.pernr = pa0002.pernr AND pa0002.fecha = ea.fecha --AND (pa0002.sprsl = 'S' OR pa0002.sprsl = 'P')
  LEFT JOIN db_koandina_regional_analyticssec.hrgender2text_analyticssec gen ON gen.key1 = pa0002.gesch AND gen.langu = pa0002.sprsl
  LEFT JOIN db_koandina_regional_analyticssec.hrt005t_analyticssec t005t ON t005t.land1 = pa0002.natio AND t005t.spras = pa0002.sprsl
  LEFT JOIN pa0004 pa0004 ON pa0004.pernr = ea.pernr AND pa0004.fecha = ea.fecha
  LEFT JOIN pa0041 pa0041 ON pa0041.pernr = ea.pernr AND pa0041.fecha = ea.fecha
  LEFT JOIN posicion pos ON pos.key1 = ea.plans AND pos.langu = pa0002.sprsl AND pos.fecha = ea.fecha
  LEFT JOIN pasante_paraguay pas_p ON pas_p.key1 = ea.plans
  LEFT JOIN ocacional_paraguay oca_p ON oca_p.key1 = ea.plans
  LEFT JOIN ccosto ccos ON ccos.kokrs = ea.kokrs AND ccos.kostl = ea.kostl AND ccos.langu = pa0002.sprsl AND ccos.fecha = ea.fecha
  LEFT JOIN db_koandina_cl_analyticssec.hrconve_analyticssec con ON con.desti = ea.kostl
  LEFT JOIN pa0105 pa0105 ON pa0105.pernr = ea.pernr AND pa0105.fecha = ea.fecha
  LEFT JOIN rota_arg rota_arg ON rota_arg.pernr = ea.pernr AND rota_arg.fecha = ea.fecha
)
, inactivos as (
  SELECT DISTINCT
     ea.pernr nro_pers
  , ea.sname nomb_pers
  , ea.bukrs cod_sociedad
  , cct.txtmd sociedad
  , (CASE WHEN ((ea.bukrs = '3046') OR (ea.bukrs = '3047')) THEN 'Argentina' WHEN (ea.bukrs = '3048') THEN 'Brasil' WHEN ((((ea.bukrs = '3043') OR (ea.bukrs = '3044')) OR (ea.bukrs = '3045')) OR (ea.bukrs = '3050')) THEN 'Chile' WHEN (ea.bukrs = '3049') THEN 'Paraguay' END) operacion
  , pstt.txtsh localidad
  , (CASE WHEN ((ea.werks = '8C1F') OR (ea.werks = '8C2F')) THEN 'Antofagasta' WHEN ((ea.werks = '8C1Q') OR (ea.werks = '8C2Q')) THEN 'Coquimbo' WHEN ((ea.werks = '8C1G') OR (ea.werks = '8C2G')) THEN 'Punta Arenas' ELSE 'Centro' END) zona
  , (CASE WHEN (((ea.kostl = t23.kostl) AND (ea.trfar = t23.trfar)) AND ((((ea.bukrs = '3043') OR (ea.bukrs = '3044')) OR (ea.bukrs = '3045')) OR (ea.bukrs = '3050'))) THEN t23.gerencia1 WHEN ((ea.kostl = t23null.kostl) AND ((((ea.bukrs = '3043') OR (ea.bukrs = '3044')) OR (ea.bukrs = '3045')) OR (ea.bukrs = '3050'))) THEN t23null.gerencia1 ELSE null END) gerencia_1
  , (CASE WHEN (((ea.kostl = t23.kostl) AND (ea.trfar = t23.trfar)) AND ((((ea.bukrs = '3043') OR (ea.bukrs = '3044')) OR (ea.bukrs = '3045')) OR (ea.bukrs = '3050'))) THEN t23.gerencia2 WHEN ((ea.kostl = t23null.kostl) AND ((((ea.bukrs = '3043') OR (ea.bukrs = '3044')) OR (ea.bukrs = '3045')) OR (ea.bukrs = '3050'))) THEN t23null.gerencia2 ELSE null END) gerencia_2
  , ea.orgeh cod_un_org
  , org.txtmd desc_un_org
--   , p1051.jcode grado_hay
  ,CASE WHEN ea.bukrs = '3049' AND p1051.subty = 'HAYP'         --paraguay
			THEN p1051.jcode
        WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND p1051.subty = 'HAY'   --argentina
			THEN p1051.jcode
        WHEN (ea.bukrs = '3048')  AND p1051.subty = 'HAY'     --Brasil
			THEN p1051.jcode
		WHEN (ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050') AND p1051.subty = 'HAY'     --chile
			THEN p1051.jcode
  END grado_hay    
--   , (CASE WHEN ((ea.bukrs = '3049') AND (ea.persk = '8E')) THEN COALESCE(COALESCE(trim(oca_p.txtmd), trim(pas_p.txtmd)), 'PLANTA') WHEN ((ea.bukrs = '3049') AND (ea.persk <> '8E')) THEN 'PLANTA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('21', '26', '35'))) THEN 'PLANTA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('20', '52', '53'))) THEN 'TEMPORADA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('68'))) THEN 'PRACTICA' WHEN ((ea.bukrs = '3048') AND (ea.persk IN ('84', '87'))) THEN 'PRACTICA' WHEN ((ea.bukrs = '3048') AND (NOT (ea.persk IN ('84', '87')))) THEN 'PLANTA' ELSE COALESCE(trim(rota2.rotacion), trim(rota1.rotacion)) END) rotacion
  ,CASE 
      WHEN ea.bukrs = '3049' AND ea.persk = '8E' THEN COALESCE(COALESCE(trim(oca_p.txtmd), trim(pas_p.txtmd)), 'PLANTA') 
      WHEN ea.bukrs = '3049' AND ea.persk <> '8E' THEN 'PLANTA' 
      WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('21', '26', '35') THEN 'PLANTA' 
      WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('30', '52', '53') THEN 'TEMPORADA' 
      WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('68') THEN 'PRACTICA' 
      WHEN ea.bukrs = '3048' AND ea.persk IN ('84', '87') THEN 'PRACTICA' 
      WHEN ea.bukrs = '3048' AND NOT(ea.persk IN ('84', '87')) THEN 'PLANTA' 
--    WHEN (ea.bukrs = '3049') AND
--    WHEN (ea.bukrs = '3049') AND
--    WHEN (ea.bukrs = '3049') AND rol_py.cttyp IN ('68')                   THEN 'PRACTICA' 
--    ELSE COALESCE(trim(rota2.rotacion), trim(rota1.rotacion)) 
	  ELSE trim(rota.rotacion)                                              -- cambio rotacion chile
      END rotacion    --cambio de valor 20 por 30 en condicion rota_arg.cttyp
--   , COALESCE(rol2.rol, rol1.rol) rol
  ,CASE
    WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND ea.abkrs IN ('80', '82', '84', '86')    THEN 'ROL GENERAL' 
    WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND ea.abkrs IN ('81', '83', '8A')        THEN 'ROL PROFESIONAL'
    WHEN (ea.bukrs = '3046' OR ea.bukrs = '3047') AND rota_arg.cttyp IN ('68')        THEN 'PRACTICA' 
    ELSE COALESCE(rol2.rol, rol1.rol) 
    END rol     --cambio de rol dic-22
  , gen.txtlg genero
  , t005t.natio nacionalidad
  , (CASE WHEN (pa0004.sbgru IS NOT NULL) THEN 'SI' ELSE 'NO' END) condicion
  , pa0041.dat01 fech_ing
  , pa0002.gbdat fech_nac
  , ea.plans cod_cargo
  , pos.txtmd cargo
  , ccos.kostl cod_centro_costo
  , ccos.txtmd centro_costo
  , (CASE WHEN ((ea.bukrs = '3043') OR (ea.bukrs = '3044')) THEN ea.kostl WHEN ((ea.bukrs = '3045') OR (ea.bukrs = '3050')) THEN con.orige ELSE ea.kostl END) cod_cen_cost_imp
  , pa0002.sprsl idioma
  , pa0105.usrid_long mail
  , rota_arg.cttyp cod_clasecontrato
  , ea.fecha
  , ea.anio anio
  , ea.mes mes
  ,ea.persk area_de_personal
  FROM
  employee_attr_inact ea
  LEFT JOIN db_koandina_regional_analytics.comp_code_text_analytics cct ON ea.bukrs = cct.key1 AND cct.txtmd is not null

                                  LEFT JOIN db_koandina_regional_stage.hrperssarea2text_stagesec pstt ON ea.btrtl = pstt.btrtl AND ea.werks = pstt.werks

  LEFT JOIN t23 t23 ON ea.kostl = t23.kostl
  LEFT JOIN t23null t23null ON ea.kostl = t23null.kostl
  LEFT JOIN organizacion org ON org.key1 = ea.orgeh AND org.fecha = ea.fecha
  LEFT JOIN p1051 p1051 ON p1051.objid = ea.plans AND p1051.fecha = ea.fecha
  -- LEFT JOIN rota1 rota1 ON rota1.trfar = ea.trfar AND rota1.stell = '00000000'
  -- LEFT JOIN rota2 rota2 ON rota2.trfar = ea.trfar AND rota2.stell = ea.stell
  LEFT JOIN db_koandina_cl_analyticssec.hrt024_analyticssec rota ON rota.trfar = ea.trfar
  LEFT JOIN rol1 rol1 ON rol1.trfar = ea.trfar AND rol1.stell = '00000000'
  LEFT JOIN rol2 rol2 ON rol2.trfar = ea.trfar AND rol2.stell = ea.stell
  inner JOIN pa0002 pa0002 ON ea.pernr = pa0002.pernr AND pa0002.fecha = ea.fecha --AND (pa0002.sprsl = 'S' OR pa0002.sprsl = 'P')
  LEFT JOIN db_koandina_regional_analyticssec.hrgender2text_analyticssec gen ON gen.key1 = pa0002.gesch AND gen.langu = pa0002.sprsl
  LEFT JOIN db_koandina_regional_analyticssec.hrt005t_analyticssec t005t ON t005t.land1 = pa0002.natio AND t005t.spras = pa0002.sprsl
  LEFT JOIN pa0004 pa0004 ON pa0004.pernr = ea.pernr AND pa0004.fecha = ea.fecha
  LEFT JOIN pa0041 pa0041 ON pa0041.pernr = ea.pernr AND pa0041.fecha = ea.fecha
  LEFT JOIN posicion pos ON pos.key1 = ea.plans AND pos.langu = pa0002.sprsl AND pos.fecha = ea.fecha
  LEFT JOIN pasante_paraguay pas_p ON pas_p.key1 = ea.plans
  LEFT JOIN ocacional_paraguay oca_p ON oca_p.key1 = ea.plans
  LEFT JOIN ccosto ccos ON ccos.kokrs = ea.kokrs AND ccos.kostl = ea.kostl AND ccos.langu = pa0002.sprsl AND ccos.fecha = ea.fecha
  LEFT JOIN db_koandina_cl_analyticssec.hrconve_analyticssec con ON con.desti = ea.kostl
  LEFT JOIN pa0105 pa0105 ON pa0105.pernr = ea.pernr AND pa0105.fecha = ea.fecha
  LEFT JOIN rota_arg rota_arg ON rota_arg.pernr = ea.pernr AND rota_arg.fecha = ea.fecha
WHERE  ea.persk != ''
)

-- (SELECT DISTINCT
--       nro_pers
--     , nomb_pers
--     , cod_sociedad
--     , sociedad
--     , operacion
--     , localidad
--     , zona
--     , gerencia_1
--     , gerencia_2
--     , cod_un_org
--     , desc_un_org
--     , grado_hay
--     , rotacion
--     , rol
--     , genero
--     , nacionalidad
--     , condicion
--     , fech_ing
--     , fech_nac
--     , cod_cargo
--     , cargo
--     , cod_centro_costo
--     , centro_costo
--     , cod_cen_cost_imp
--     , idioma
--     , mail
--     , cod_clasecontrato
--     , anio
--     , mes
--     , area_de_personal
-- FROM activos
-- WHERE  cod_sociedad != ''
-- -- WHERE   
-- -- (fecha = ult_dia_mes OR fecha = date_trunc('month',  current_date)) AND
-- -- sociedad IS NOT NULL
-- group by 
--       nro_pers
--     , nomb_pers
--     , cod_sociedad
--     , sociedad
--     , operacion
--     , localidad
--     , zona
--     , gerencia_1
--     , gerencia_2
--     , cod_un_org
--     , desc_un_org
--     , grado_hay
--     , rotacion
--     , rol
--     , genero
--     , nacionalidad
--     , condicion
--     , fech_ing
--     , fech_nac
--     , cod_cargo
--     , cargo
--     , cod_centro_costo
--     , centro_costo
--     , cod_cen_cost_imp
--     , idioma
--     , mail
--     , cod_clasecontrato
--     , anio
--     , mes
--     , area_de_personal
-- )

-- UNION ALL

(SELECT DISTINCT
  nro_pers
, nomb_pers
, cod_sociedad
, sociedad
, operacion
, localidad
, zona
, gerencia_1
, gerencia_2
, cod_un_org
, desc_un_org
, grado_hay
, rotacion
, rol
, genero
, nacionalidad
, condicion
, fech_ing
, fech_nac
, cod_cargo
, cargo
, cod_centro_costo
, centro_costo
, cod_cen_cost_imp
, idioma
, mail
, cod_clasecontrato
, anio
, mes
, area_de_personal
FROM inactivos
WHERE  cod_sociedad != '' 
)

UNION ALL

(SELECT DISTINCT
      nro_pers
    , nomb_pers
    , cod_sociedad
    , sociedad
    , operacion
    , localidad
    , zona
    , gerencia_1
    , gerencia_2
    , cod_un_org
    , desc_un_org
    , grado_hay
    , rotacion
    , rol
    , genero
    , nacionalidad
    , condicion
    , fech_ing
    , fech_nac
    , cod_cargo
    , cargo
    , cod_centro_costo
    , centro_costo
    , cod_cen_cost_imp
    , idioma
    , mail
    , cod_clasecontrato
    , anio
    , mes
    , area_de_personal
FROM activos
WHERE  cod_sociedad != ''
-- WHERE   
-- (fecha = ult_dia_mes OR fecha = date_trunc('month',  current_date)) AND
-- sociedad IS NOT NULL
group by 
      nro_pers
    , nomb_pers
    , cod_sociedad
    , sociedad
    , operacion
    , localidad
    , zona
    , gerencia_1
    , gerencia_2
    , cod_un_org
    , desc_un_org
    , grado_hay
    , rotacion
    , rol
    , genero
    , nacionalidad
    , condicion
    , fech_ing
    , fech_nac
    , cod_cargo
    , cargo
    , cod_centro_costo
    , centro_costo
    , cod_cen_cost_imp
    , idioma
    , mail
    , cod_clasecontrato
    , anio
    , mes
    , area_de_personal
)

