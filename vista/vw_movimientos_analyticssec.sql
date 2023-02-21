CREATE OR REPLACE VIEW "vw_movimientos_analyticssec" AS
SELECT DISTINCT
  hrpa0000.pernr nro_pers
, hrpa0000.begda desde
, hrpa0000.endda hasta
, "date_parse"("concat"("substr"(hrpa0000.endda, 1, 8), '01'), '%Y-%m-%d') fecha
, hrpa0000.massn cod_medida
, act.txtmd des_medida
, hrpa0000.massg cod_motivo
, 'N/A' des_motivo
, hrpa0000.stat1 estatus
, hrpa0000.stat2 estatus1
, hrpa0000.stat3 estatus2
FROM
  (db_koandina_regional_analyticssec.hrpa0000_analyticssec hrpa0000
LEFT JOIN db_koandina_regional_analytics.hractionreas2text_analytics act ON (((act.massn = hrpa0000.massn) AND (act.massg = hrpa0000.massg)) AND (act.langu = 'S')))
LEFT JOIN
