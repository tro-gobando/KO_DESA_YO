CREATE OR REPLACE VIEW "vw_hr_dota_bp_analyticssec" AS 
select anio,'01' as mes,pais,ceco_dot,cargo,enero as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'02' as mes,pais,ceco_dot,cargo,febrero as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'03' as mes,pais,ceco_dot,cargo,marzo as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'04' as mes,pais,ceco_dot,cargo,abril as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'05' as mes,pais,ceco_dot,cargo,mayo as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'06' as mes,pais,ceco_dot,cargo,junio as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'07' as mes,pais,ceco_dot,cargo,julio as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'08' as mes,pais,ceco_dot,cargo,agosto as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'09' as mes,pais,ceco_dot,cargo,septiembre as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'10' as mes,pais,ceco_dot,cargo,octubre as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'11' as mes,pais,ceco_dot,cargo,noviembre as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
union
select anio,'12' as mes,pais,ceco_dot,cargo,diciembre as bp from db_koandina_regional_analyticssec.hr_dota_bp_analyticssec
order by 1,2,3