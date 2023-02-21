CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hrpa0004_analyticssec AS
select
  hrpa0004.pernr,
  hrpa0004.subty,
  hrpa0004.objps,
  hrpa0004.sprps,
  hrpa0004.endda,
  hrpa0004.begda,
  hrpa0004.seqnr,
  hrpa0004.aedtm,
  hrpa0004.uname,
  hrpa0004.histo,
  hrpa0004.itxex,
  hrpa0004.refex,
  hrpa0004.ordex,
  hrpa0004.itbld,
  hrpa0004.preas,
  hrpa0004.flag1,
  hrpa0004.flag2,
  hrpa0004.flag3,
  hrpa0004.flag4,
  hrpa0004.rese1,
  hrpa0004.rese2,
  hrpa0004.grpvl,
  hrpa0004.sbgru,
  hrpa0004.sbpro,
  hrpa0004.sbart,
  hrpa0004.sbfak,
  hrpa0004.sbdst,
  hrpa0004.sbgsz,
  hrpa0004.sbadt,
  hrpa0004.sbds2,
  hrpa0004.sbgs2,
  hrpa0004.sbad2,
  hrpa0004.sbaud,
  hrpa0004.sbprf,
  hrpa0004.wegdt,
  hrpa0004.dnstl,
  hrpa0004.dsitz,
  hrpa0004.nachw
from db_koandina_regional_analyticssec.hrpa0004_analyticssec hrpa0004
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrpa0004.pernr = hrpa0001.pernr