CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrpa0034_analyticssec AS
select
PA0034.pernr,
PA0034.subty,
PA0034.objps,
PA0034.sprps,
PA0034.endda,
PA0034.begda,
PA0034.seqnr,
PA0034.aedtm,
PA0034.uname,
PA0034.histo,
PA0034.itxex,
PA0034.refex,
PA0034.ordex,
PA0034.itbld,
PA0034.preas,
PA0034.flag1,
PA0034.flag2,
PA0034.flag3,
PA0034.flag4,
PA0034.rese1,
PA0034.rese2,
PA0034.grpvl,
PA0034.funkt,
PA0034.dat34
from db_koandina_regional_analyticssec.hrPA0034_analyticssec PA0034
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on PA0034.pernr = hrpa0001.pernr