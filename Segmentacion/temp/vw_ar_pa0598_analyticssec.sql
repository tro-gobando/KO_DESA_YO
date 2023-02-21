CREATE OR REPLACE VIEW db_koandina_ar_analyticssec.vw_ar_hrpa0598_analyticssec AS
select
PA0598.pernr,
PA0598.subty,
PA0598.objps,
PA0598.sprps,
PA0598.endda,
PA0598.begda,
PA0598.seqnr,
PA0598.aedtm,
PA0598.uname,
PA0598.histo,
PA0598.itxex,
PA0598.refex,
PA0598.ordex,
PA0598.itbld,
PA0598.preas,
PA0598.flag1,
PA0598.flag2,
PA0598.flag3,
PA0598.flag4,
PA0598.rese1,
PA0598.rese2,
PA0598.grpvl,
PA0598.dptype,
PA0598.dptxt
from db_koandina_regional_analyticssec.hrPA0598_analyticssec PA0598
inner join db_koandina_ar_analyticssec.vw_ar_hrpa0001_analyticssec hrpa0001 on PA0598.pernr = hrpa0001.pernr