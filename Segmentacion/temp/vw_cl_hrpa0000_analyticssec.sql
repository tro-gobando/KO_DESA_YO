CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0000_analyticssec AS
select
    hrpa0000.pernr,
    hrpa0000.subty,
    hrpa0000.objps,
    hrpa0000.sprps,
    hrpa0000.endda,
    hrpa0000.begda,
    hrpa0000.seqnr,
    hrpa0000.aedtm,
    hrpa0000.uname,
    hrpa0000.histo,
    hrpa0000.itxex,
    hrpa0000.refex,
    hrpa0000.ordex,
    hrpa0000.itbld,
    hrpa0000.preas,
    hrpa0000.flag1,
    hrpa0000.flag2,
    hrpa0000.flag3,
    hrpa0000.flag4,
    hrpa0000.rese1,
    hrpa0000.rese2,
    hrpa0000.grpvl,
    hrpa0000.massn,
    hrpa0000.massg,
    hrpa0000.stat1,
    hrpa0000.stat2,
    hrpa0000.stat3
from db_koandina_regional_analyticssec.hrpa0000_analyticssec hrpa0000
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrpa0000.pernr = hrpa0001.pernr