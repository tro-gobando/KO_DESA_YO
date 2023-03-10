CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hr_hrpa0003_analyticssec AS
select
hrpa0003.pernr,
hrpa0003.subty,
hrpa0003.objps,
hrpa0003.sprps,
hrpa0003.endda,
hrpa0003.begda,
hrpa0003.seqnr,
hrpa0003.aedtm,
hrpa0003.uname,
hrpa0003.histo,
hrpa0003.itxex,
hrpa0003.refex,
hrpa0003.ordex,
hrpa0003.itbld,
hrpa0003.preas,
hrpa0003.flag1,
hrpa0003.flag2,
hrpa0003.flag3,
hrpa0003.flag4,
hrpa0003.rese1,
hrpa0003.rese2,
hrpa0003.grpvl,
hrpa0003.abrsp,
hrpa0003.abrdt,
hrpa0003.rrdat,
hrpa0003.rrdaf,
hrpa0003.koabr,
hrpa0003.prdat,
hrpa0003.pkgab,
hrpa0003.abwd1,
hrpa0003.abwd2,
hrpa0003.bderr,
hrpa0003.bder1,
hrpa0003.kobde,
hrpa0003.timrc,
hrpa0003.dat00,
hrpa0003.uhr00,
hrpa0003.inumk,
hrpa0003.werks,
hrpa0003.sachz,
hrpa0003.sfeld,
hrpa0003.adrun,
hrpa0003.viekn,
hrpa0003.trvfl,
hrpa0003.rcbon,
hrpa0003.prtev
from db_koandina_regional_analyticssec.hrpa0003_analyticssec hrpa0003
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrpa0003.pernr = hrpa0001.pernr