CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hrpa0041_analyticssec AS
select
    hrpa0041.pernr,
    hrpa0041.subty,
    hrpa0041.objps,
    hrpa0041.sprps,
    hrpa0041.endda,
    hrpa0041.begda,
    hrpa0041.seqnr,
    hrpa0041.aedtm,
    hrpa0041.uname,
    hrpa0041.histo,
    hrpa0041.itxex,
    hrpa0041.refex,
    hrpa0041.ordex,
    hrpa0041.itbld,
    hrpa0041.preas,
    hrpa0041.flag1,
    hrpa0041.flag2,
    hrpa0041.flag3,
    hrpa0041.flag4,
    hrpa0041.rese1,
    hrpa0041.rese2,
    hrpa0041.grpvl,
    hrpa0041.dar01,
    hrpa0041.dat01,
    hrpa0041.dar02,
    hrpa0041.dat02,
    hrpa0041.dar03,
    hrpa0041.dat03,
    hrpa0041.dar04,
    hrpa0041.dat04,
    hrpa0041.dar05,
    hrpa0041.dat05,
    hrpa0041.dar06,
    hrpa0041.dat06,
    hrpa0041.dar07,
    hrpa0041.dat07,
    hrpa0041.dar08,
    hrpa0041.dat08,
    hrpa0041.dar09,
    hrpa0041.dat09,
    hrpa0041.dar10,
    hrpa0041.dat10,
    hrpa0041.dar11,
    hrpa0041.dat11,
    hrpa0041.dar12,
    hrpa0041.dat12
from db_koandina_regional_analyticssec.hrpa0041_analyticssec hrpa0041
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrpa0041.pernr = hrpa0001.pernr