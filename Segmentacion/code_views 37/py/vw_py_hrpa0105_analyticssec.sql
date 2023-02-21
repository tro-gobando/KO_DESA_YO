CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrpa0105_analyticssec AS
select
    hrpa0105.pernr,
    hrpa0105.subty,
    hrpa0105.objps,
    hrpa0105.sprps,
    hrpa0105.endda,
    hrpa0105.begda,
    hrpa0105.seqnr,
    hrpa0105.aedtm,
    hrpa0105.uname,
    hrpa0105.histo,
    hrpa0105.itxex,
    hrpa0105.refex,
    hrpa0105.ordex,
    hrpa0105.itbld,
    hrpa0105.preas,
    hrpa0105.flag1,
    hrpa0105.flag2,
    hrpa0105.flag3,
    hrpa0105.flag4,
    hrpa0105.rese1,
    hrpa0105.rese2,
    hrpa0105.grpvl,
    hrpa0105.usrty,
    hrpa0105.usrid,
    hrpa0105.usrid_long
from db_koandina_regional_analyticssec.hrpa0105_analyticssec hrpa0105
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on hrpa0105.pernr = hrpa0001.pernr