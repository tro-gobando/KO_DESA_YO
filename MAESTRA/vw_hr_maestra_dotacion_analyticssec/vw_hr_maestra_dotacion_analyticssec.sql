WITH
  tie AS (
  SELECT
    tie.fecha
  , tie.anio
  , tie.mes
  , max_dia_mes.ult_dia_mes
  FROM
     db_koandina_regional_analytics.dim_tiempo_analytics tie
   LEFT JOIN (
			  SELECT
			    MAX(fecha) ult_dia_mes
			    , anio
			    , mes
			   FROM
				db_koandina_regional_analytics.dim_tiempo_analytics
			   WHERE   anio BETWEEN year(current_date) - 2 AND year(current_date)
			   GROUP BY anio, mes
	        )  max_dia_mes ON ((max_dia_mes.mes = tie.mes) AND (max_dia_mes.anio = tie.anio))
  WHERE   tie.anio BETWEEN year(current_date) - 2 AND year(current_date)
) 

, employee_attr_tie AS (
  SELECT DISTINCT
    ea.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(ea.endda) endda, min(ea.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.employee_attr_analyticssec ea
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(ea.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(ea.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(ea.endda, '%Y-%m-%d') END)
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date and ea.stat2 = '3'
  
--   ------------------------
--   and pernr = '06012980'
  and pernr in 
  ('06050510','06081406','06061454','06076959','06008323','06038340','06076491','06062018','06096190','06092506','06094125'
,'06096165','06059148','06055351','06060670','06076493','06064227','06087030','06055173','06076891','06006681','06060248'
,'06096918','06053396','06077246','06057475','06093482','06006303','06084700','06061883','06058701','06035006','06067902'
,'06076282','06041091','06044496','06042231','06050822','06042593','06091459','06082548','06079459','06056490','06083372'
,'06008266','06066564','06089457','06069692','06101303','06089629','06077562','06054646','06050411','06092299','06084132'
,'06040162','06095058','06067861','06071512','06072487','06082384','06037405','06079237','06059574','06071955','06062014'
,'06069373','06005787','06050736','06064659','06035015','06067163','06009915','06080569','06071611','06053316','06047397'
,'06082136','06081857','06093459','06063780','06068993','06009428','06086681','06059857','06079030','06093441','06035403'
,'06092077','06050470','06065465','06054418','06056819','06059560','06081716','06075112','06091458','06077559','06014262'
,'06044446','06051244','06079136','06090484','06067036','06060880','06061231','06091782','06073684','06083119','06005722'
,'06079779','06056708','06071114','06040867','06102725','06045671','06101700','06100098','06101781','06048890','06083718'
,'06060048','06101804','06095261','06090445','06078393','06101265','06098735','06102491','06099275','06088850','06092197'
,'06077472','06058407','06087629','06049697','06081991','06041123','06101667','06081280','06079138','06071620','06102360'
,'06091499','06084894','06054575','06003383','06060269','06103601','06082206','06004403','06060219','06080807','06103341'
,'06095062','06097859','06085530','06103795','06093075','06103033','06099856','06101563','06036304','06101353','06056963'
,'06095443','06053701','06077660','06070958','06101824','06061101','06089813','06084758','06093084','06085017','06057237'
,'06036402','06101823','06058626','06064276','06071615','06101806','06087735','06096594','06102235','06101784','06019324'
,'06066249','06094710','06103147','06073284','06103068','06104302','06013533','06093421','06101866','06102554','06097680'
,'06097879','06103441','06078112','06001913','06063306','06078410','06037422','06099907','06100688','06103689','06076294'
,'06084407','06078521','06081436','06085993','06095920','06014180','06078524','06080478','06099893','06099002','06103747'
,'06103013','06102549','06101578','06101827','06002454','06102139','06061902','06090698','06059240','06090031','06044876'
,'06069803','06100233','06100000','06010037','06102323','06055381','06064195','06099274','06061012','06089225','06058388'
,'06020756','06103015','06102372','06101099','06073042','06005376','06094340','06097090','06003758','06068885','06103204'
,'06103687','06100074','06069776','06088299','06081870','06101467','06059647','06091283','06098249','06098246','06103428'
,'06096199','06096704','06101828','06064228','06100710','06100996','06101826','06095401','06102979','06101348','06096553'
,'06103600','06101489','06011422','06103075','06058687','06052744','06060140','06100339','06099505','06075097','06102773'
,'06103525','06095512','06082714','06066643','06100796','06091936','06076477','06101967','06098472','06068963','06051304'
,'06102326','06103179','06098583','06012908','06095845','06102321','06004521','06060110','06103399','06028810','06101909'
,'06101709','06096043','06092809','06055837','06102548','06100118','06076284','06086338','06056452','06100805','06096897'
,'06058267','06057996','06077583','06086693','06058262','06057863','06056927','06103069','06081990','06093277','06103494'
,'06051154','06093083','06103205','06102931','06096113','06083170','06102993','06103802','06063726','06014147','06093428'
,'06102547','06103688','06067774','06102325','06088544','06044008','06088668','06099965','06102556','06103164','06101715'
,'06083299','06051396','06100967','06085979','06102538','06102523','06079493','06056394','06041223','06102988','06066713'
,'06102557','06083713','06055591','06084223','06103014','06066652','06101848','06100060','06084116','06070742','06089857'
,'06056956','06102493','06069367','06069060','06101725','06103018','06024763','06086427','06086069','06053562','06103031'
,'06097837','06089656','06102742','06060165','06073479','06060469','06090322','06079996','06094849','06095064','06034965'
,'06059514','06102536','06076445','06102059','06038799','06057124','06088099','06103153','06101910','06080972','06101650'
,'06098890','06092198','06089631','06062184','06088117','06098579','06083157','06064747','06067550','06092426','06103169'
,'06100277','06090986','06103234','06087934','06103073','06092830','06097710','06069457','06103686','06088894','06095834'
,'06092730','06082234','06042854','06012456','06088405','06086590','06061878','06056910','06093621','06087856','06056156'
,'06064755','06073929','06100124','06049607','06101070','06100160','06102402','06070479','06039019','06009419','06093498'
,'06096821','06078630','06097720','06080998','06103155','06103769','06078187','06095380','06094951','06103604','06005620'
,'06103827','06084604','06103070','06100935','06103694','06103517','06038769','06064120','06074184','06098926','06103690'
,'06101825','06099687','06035381','06097838','06096875','06100553')
--   ------------------------
  
  GROUP BY ea.pernr, mes, anio, tie.ult_dia_mes
) --395.493  391.866

, employee_attr AS (
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
  , at.anio
  , at.mes
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
--   , tie.ult_dia_mes
  FROM employee_attr_tie at
  LEFT JOIN db_koandina_regional_analyticssec.employee_attr_analyticssec ea
        ON ea.pernr = at.pernr AND ea.endda = at.endda and ea.begda = at.begda
  WHERE 
--   (((stat2 = '3') AND 
  "year"(at.fecha) >= "year"(current_date) - 2 AND at.fecha <= current_date
)



-- select * from employee_attr where anio = 2022 and mes = 12
-----------------------------------------------------------------------------------------------------------------





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
    pa0002.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pa0002.endda) endda, min(pa0002.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0002.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(pa0002.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0002.endda, '%Y-%m-%d') END)
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date AND trim(sprsl) <> ''
  GROUP BY pa0002.pernr, tie.mes, tie.anio, tie.ult_dia_mes
) 

, pa0002 AS (
  SELECT 
    case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
  , pa0002.pernr
  , pa0002.sprsl
  , pa0002.natio
  , pa0002.gesch
  , "max"(pa0002.gbdat) gbdat
  FROM pa0002_tie at
  LEFT JOIN db_koandina_regional_analyticssec.HRPA0002_analyticssec pa0002
        ON pa0002.pernr = at.pernr AND pa0002.endda = at.endda and pa0002.begda = at.begda
  WHERE pa0002.sprsl = 'S' OR pa0002.sprsl = 'P' 
  GROUP BY pa0002.pernr, pa0002.sprsl, pa0002.natio, pa0002.gesch, case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end
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
    p1051.objid, p1051.jcode, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(p1051.endda) endda, min(p1051.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.hrp1051_analyticssec p1051
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(p1051.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(p1051.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(p1051.endda, '%Y-%m-%d') END)
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY  p1051.objid, p1051.jcode, tie.mes ,tie.anio, tie.ult_dia_mes
)

, p1051 AS (
  SELECT DISTINCT
   case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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
     AND year(at.fecha) >= year(current_date) - 2
     AND at.fecha <= current_date    --se agrega grado hay para paraguay dic-22  
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
    pa0004.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pa0004.endda) endda, min(pa0004.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.hrpa0004_analyticssec pa0004
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0004.begda, '%Y-%m-%d') AND (CASE WHEN date_parse(pa0004.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0004.endda, '%Y-%m-%d') END)
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY pa0004.pernr, mes, anio, tie.ult_dia_mes
) 

, pa0004 AS (
  SELECT DISTINCT
    pa0004.pernr
  , pa0004.sbgru
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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

-- , pa0041 AS (
  -- SELECT DISTINCT
    -- pa0041.pernr, MAX(tie.fecha) fecha, MAX(pa0041.dat01) dat01, tie.mes , tie.anio, tie.ult_dia_mes--, min(pa0041.begda) begda
  -- FROM
     -- db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
  -- LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0041.begda, '%Y-%m-%d') AND CASE WHEN date_parse(pa0041.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0041.endda, '%Y-%m-%d') END
  -- WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date --and pa0041.begda = at.begda
            -- --   AND pa0041.pernr = '06000001'
  -- GROUP BY pa0041.pernr, mes, anio, tie.ult_dia_mes
                -- -- order by tie.anio, tie.mes
-- )

,pa0041_tie AS (
  SELECT DISTINCT
    pa0041.pernr, MAX(tie.fecha) fecha,  MAX(pa0041.dat01) dat01,tie.mes , tie.anio, MAX(pa0041.endda) endda, min(pa0041.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pa0041.begda, '%Y-%m-%d') AND CASE WHEN date_parse(pa0041.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pa0041.endda, '%Y-%m-%d') END
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY pa0041.pernr, mes, anio, tie.ult_dia_mes
) 
, pa0041 AS (
  SELECT DISTINCT
    pa0041.pernr
  , pa0041.dat01
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
  FROM pa0041_tie at
  LEFT JOIN db_koandina_regional_analyticssec.HRPA0041_analyticssec pa0041
	    ON pa0041.pernr = at.pernr AND pa0041.endda = at.endda and pa0041.begda = at.begda
)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ AQUIIIIIIIIIIIIIIIIII
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
    pos.key1, pos.langu, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pos.dateto) dateto, min(pos.datefrom) datefrom, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.hrpositiontext_analyticssec pos
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(pos.datefrom, '%Y-%m-%d') AND CASE WHEN date_parse(pos.dateto, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(pos.dateto, '%Y-%m-%d') END
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY pos.key1,pos.langu,  mes, anio, tie.ult_dia_mes
) 
, posicion AS (
  SELECT DISTINCT
    pos.txtmd
  , pos.key1
  , pos.langu
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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
    ccos.kokrs, ccos.kostl, ccos.langu, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(ccos.dateto) dateto, min(ccos.datefrom) datefrom, tie.ult_dia_mes
  FROM
     db_koandina_regional_analytics.costcenter_text_analytics ccos
  LEFT JOIN tie tie ON (tie.fecha BETWEEN ccos.datefrom AND (CASE WHEN (ccos.dateto > current_date) THEN current_date ELSE ccos.dateto END))
  WHERE year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY ccos.kokrs, ccos.kostl, ccos.langu, mes, anio, tie.ult_dia_mes
) 
, ccosto AS (
  SELECT DISTINCT
    ccos.txtmd
  , ccos.kokrs
  , ccos.kostl
  , ccos.langu
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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
    pa0105.pernr, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(pa0105.endda) endda, min(pa0105.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.HRPA0105_analyticssec pa0105
    LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(pa0105.begda, '%Y-%m-%d') AND (CASE WHEN (date_parse(pa0105.endda, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(pa0105.endda, '%Y-%m-%d') END))
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date AND pa0105.usrty = '0010'
    --  AND pa0105.usrty = '0010' 
     AND year(tie.fecha) >= year(current_date) - 2 
     AND tie.fecha <= current_date 
    --  AND trim(pa0105.usrid_long) <> ''
  GROUP BY pa0105.pernr, mes, anio, tie.ult_dia_mes
) 
, pa0105 AS (
  SELECT DISTINCT
     pa0105.pernr
  , pa0105.usrid_long
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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
    org.key1, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(org.dateto) dateto, min(org.datefrom) datefrom, tie.ult_dia_mes
  FROM
     (db_koandina_regional_analyticssec.hrorgunittext_analyticssec org
  LEFT JOIN tie tie ON (tie.fecha BETWEEN date_parse(org.datefrom, '%Y-%m-%d') AND (CASE WHEN (date_parse(org.dateto, '%Y-%m-%d') > current_date) THEN current_date ELSE date_parse(org.dateto, '%Y-%m-%d') END)))
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY org.key1, mes, anio, tie.ult_dia_mes
) 

, organizacion AS (
  SELECT DISTINCT
    org.key1
  , org.txtmd
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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
    hrpa0016.pernr, hrpa0016.cttyp, MAX(tie.fecha) fecha, tie.mes , tie.anio, MAX(hrpa0016.endda) endda, min(hrpa0016.begda) begda, tie.ult_dia_mes
  FROM
     db_koandina_regional_analyticssec.hrpa0016_analyticssec hrpa0016
  LEFT JOIN tie tie ON tie.fecha BETWEEN date_parse(hrpa0016.begda, '%Y-%m-%d') AND CASE WHEN date_parse(hrpa0016.endda, '%Y-%m-%d') > current_date THEN current_date ELSE date_parse(hrpa0016.endda, '%Y-%m-%d') END
  WHERE   year(tie.fecha) >= year(current_date) - 2 AND tie.fecha <= current_date
  GROUP BY hrpa0016.pernr, hrpa0016.cttyp, mes, anio, tie.ult_dia_mes
) 

, rota_arg AS (
  SELECT DISTINCT
    hrpa0016.pernr
  , hrpa0016.cttyp
  , case when at.fecha <= at.ult_dia_mes then at.ult_dia_mes end fecha
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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

, activos AS (
  SELECT DISTINCT

    ea.pernr nro_pers
  , ea.sname nomb_pers
  , ea.bukrs cod_sociedad
  , cct.txtmd sociedad
  , CASE WHEN ea.bukrs = '3046' OR ea.bukrs = '3047' THEN 'Argentina' WHEN ea.bukrs = '3048' THEN 'Brasil' WHEN ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050' THEN 'Chile' WHEN ea.bukrs = '3049' THEN 'Paraguay' END operacion
  , pstt.txtsh localidad
  , CASE WHEN ea.werks = '8C1F' OR ea.werks = '8C2F' THEN 'Antofagasta' WHEN ea.werks = '8C1Q' OR ea.werks = '8C2Q' THEN 'Coquimbo' WHEN ea.werks = '8C1G' OR ea.werks = '8C2G' THEN 'Punta Arenas' ELSE 'Centro' END zona
  , CASE WHEN ea.kostl = t23.kostl AND ea.trfar = t23.trfar AND ea.bukrs in ('3043','3044','3045','3050') THEN t23.gerencia1 WHEN ea.kostl = t23null.kostl AND ea.bukrs in ('3043' ,'3044' ,'3045' ,'3050') THEN t23null.gerencia1 ELSE null END gerencia_1
  , CASE WHEN ea.kostl = t23.kostl AND ea.trfar = t23.trfar AND ea.bukrs in ('3043','3044','3045','3050') THEN t23.gerencia2 WHEN ea.kostl = t23null.kostl AND ea.bukrs in ('3043' ,'3044' ,'3045' ,'3050') THEN t23null.gerencia2 ELSE null END gerencia_2
  , ea.orgeh cod_un_org
  , org.txtmd desc_un_org
-- --   , p1051.jcode grado_hay
  , CASE WHEN ea.bukrs = '3049' AND p1051.subty = 'HAYP' 																	-- Paraguay
			THEN p1051.jcode
		 WHEN ea.bukrs = '3046' OR ea.bukrs = '3047' AND p1051.subty = 'HAY' 												-- Argentina
			THEN p1051.jcode
		 WHEN ea.bukrs = '3048'  AND p1051.subty = 'HAY' 																	-- Brasil
			THEN p1051.jcode
		 WHEN (ea.bukrs = '3043' OR ea.bukrs = '3044' OR ea.bukrs = '3045' OR ea.bukrs = '3050') AND p1051.subty = 'HAY'	-- Chile
			THEN p1051.jcode
	 END grado_hay	  
-- --   , (CASE WHEN ((ea.bukrs = '3049') AND (ea.persk = '8E')) THEN COALESCE(COALESCE(trim(oca_p.txtmd), trim(pas_p.txtmd)), 'PLANTA') WHEN ((ea.bukrs = '3049') AND (ea.persk <> '8E')) THEN 'PLANTA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('21', '26', '35'))) THEN 'PLANTA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('20', '52', '53'))) THEN 'TEMPORADA' WHEN (((ea.bukrs = '3046') OR (ea.bukrs = '3047')) AND (rota_arg.cttyp IN ('68'))) THEN 'PRACTICA' WHEN ((ea.bukrs = '3048') AND (ea.persk IN ('84', '87'))) THEN 'PRACTICA' WHEN ((ea.bukrs = '3048') AND (NOT (ea.persk IN ('84', '87')))) THEN 'PLANTA' ELSE COALESCE(trim(rota2.rotacion), trim(rota1.rotacion)) END) rotacion
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
	  
-- --   , COALESCE(rol2.rol, rol1.rol) rol
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
-- -- , ea.ult_dia_mes
  , ea.anio anio
  , ea.mes mes
  , ea.endda
  , ea.persk area_de_personal
  FROM
  employee_attr ea
  LEFT JOIN db_koandina_regional_analytics.comp_code_text_analytics cct ON ea.bukrs = cct.key1 AND cct.txtmd is not null

                                LEFT JOIN db_koandina_regional_stage.hrperssarea2text_stagesec pstt ON ea.btrtl = pstt.btrtl AND ea.werks = pstt.werks

  LEFT JOIN t23 t23 ON ea.kostl = t23.kostl
  LEFT JOIN t23null t23null ON ea.kostl = t23null.kostl
  LEFT JOIN organizacion org ON org.key1 = ea.orgeh AND org.fecha = ea.fecha
  LEFT JOIN p1051 p1051 ON p1051.objid = ea.plans AND p1051.fecha = ea.fecha
--   -- LEFT JOIN rota1 rota1 ON rota1.trfar = ea.trfar AND rota1.stell = '00000000'
--   -- LEFT JOIN rota2 rota2 ON rota2.trfar = ea.trfar AND rota2.stell = ea.stell
  LEFT JOIN db_koandina_cl_analyticssec.hrt024_analyticssec rota ON rota.trfar = ea.trfar
  LEFT JOIN rol1 rol1 ON rol1.trfar = ea.trfar AND rol1.stell = '00000000'
  LEFT JOIN rol2 rol2 ON rol2.trfar = ea.trfar AND rol2.stell = ea.stell
  left JOIN pa0002 pa0002 ON ea.pernr = pa0002.pernr AND pa0002.fecha = ea.fecha --AND (pa0002.sprsl = 'S' OR pa0002.sprsl = 'P')
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

-----------------------------------------------------------------------------------------------------------------------
select * from activos
-------------------------------------------------------------------------------------------------------------------------

-- SELECT DISTINCT
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



-- -- group by 
-- --       nro_pers
-- --     , nomb_pers
-- --     , cod_sociedad
-- --     , sociedad
-- --     , operacion
-- --     , localidad
-- --     , zona
-- --     , gerencia_1
-- --     , gerencia_2
-- --     , cod_un_org
-- --     , desc_un_org
-- --     , grado_hay
-- --     , rotacion
-- --     , rol
-- --     , genero
-- --     , nacionalidad
-- --     , condicion
-- --     , fech_ing
-- --     , fech_nac
-- --     , cod_cargo
-- --     , cargo
-- --     , cod_centro_costo
-- --     , centro_costo
-- --     , cod_cen_cost_imp
-- --     , idioma
-- --     , mail
-- --     , cod_clasecontrato
-- --     , anio
-- --     , mes
-- --     , area_de_personal





-- -- select * from  db_koandina_regional_analyticssec.vw_hr_maestra_dotacion_analyticssec WHERE   nro_pers = '06013351' order by anio, mes
