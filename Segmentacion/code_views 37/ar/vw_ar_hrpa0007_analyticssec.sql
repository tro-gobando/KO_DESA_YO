CREATE OR REPLACE VIEW db_koandina_ar_analyticssec.vw_ar_hrpa0007_analyticssec AS
select
    hrpa0007.pernr,
    hrpa0007.subty,
    hrpa0007.objps,
    hrpa0007.sprps,
    hrpa0007.endda,
    hrpa0007.begda,
    hrpa0007.seqnr,
    hrpa0007.aedtm,
    hrpa0007.uname,
    hrpa0007.histo,
    hrpa0007.itxex,
    hrpa0007.refex,
    hrpa0007.ordex,
    hrpa0007.itbld,
    hrpa0007.preas,
    hrpa0007.flag1,
    hrpa0007.flag2,
    hrpa0007.flag3,
    hrpa0007.flag4,
    hrpa0007.rese1,
    hrpa0007.rese2,
    hrpa0007.grpvl,
    hrpa0007.schkz,
    hrpa0007.zterf,
    hrpa0007.empct,
    hrpa0007.mostd,
    hrpa0007.wostd,
    hrpa0007.arbst,
    hrpa0007.wkwdy,
    hrpa0007.jrstd,
    hrpa0007.teilk,
    hrpa0007.minta,
    hrpa0007.maxta,
    hrpa0007.minwo,
    hrpa0007.maxwo,
    hrpa0007.minmo,
    hrpa0007.maxmo,
    hrpa0007.minja,
    hrpa0007.maxja,
    hrpa0007.dysch,
    hrpa0007.kztim,
    hrpa0007.wweek,
    hrpa0007.awtyp
from db_koandina_regional_analyticssec.hrpa0007_analyticssec hrpa0007
inner join db_koandina_ar_analyticssec.vw_ar_hrpa0001_analyticssec hrpa0001 on hrpa0007.pernr = hrpa0001.pernr