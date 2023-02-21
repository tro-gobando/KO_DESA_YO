CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0410_analyticssec AS
select
PA0410.pernr,
PA0410.subty,
PA0410.objps,
PA0410.sprps,
PA0410.endda,
PA0410.begda,
PA0410.seqnr,
PA0410.aedtm,
PA0410.uname,
PA0410.histo,
PA0410.itxex,
PA0410.refex,
PA0410.ordex,
PA0410.itbld,
PA0410.preas,
PA0410.flag1,
PA0410.flag2,
PA0410.flag3,
PA0410.flag4,
PA0410.rese1,
PA0410.rese2,
PA0410.grpvl,
PA0410.trans,
PA0410.tviag
from db_koandina_regional_analyticssec.hrPA0410_analyticssec PA0410
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on PA0410.pernr = hrpa0001.pernr