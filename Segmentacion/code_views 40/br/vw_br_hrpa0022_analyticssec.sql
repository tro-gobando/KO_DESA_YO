CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hr_hrpa0022_analyticssec AS
select
    hrpa0022.pernr,
    hrpa0022.subty,
    hrpa0022.objps,
    hrpa0022.sprps,
    hrpa0022.endda,
    hrpa0022.begda,
    hrpa0022.seqnr,
    hrpa0022.aedtm,
    hrpa0022.uname,
    hrpa0022.histo,
    hrpa0022.itxex,
    hrpa0022.refex,
    hrpa0022.ordex,
    hrpa0022.itbld,
    hrpa0022.preas,
    hrpa0022.flag1,
    hrpa0022.flag2,
    hrpa0022.flag3,
    hrpa0022.flag4,
    hrpa0022.rese1,
    hrpa0022.rese2,
    hrpa0022.grpvl,
    hrpa0022.slart,
    hrpa0022.insti,
    hrpa0022.sland,
    hrpa0022.ausbi,
    hrpa0022.slabs,
    hrpa0022.anzkl,
    hrpa0022.anzeh,
    hrpa0022.sltp1,
    hrpa0022.sltp2,
    hrpa0022.jbez1,
    hrpa0022.waers,
    hrpa0022.slpln,
    hrpa0022.slktr,
    hrpa0022.slrzg,
    hrpa0022.ksbez,
    hrpa0022.tx122,
    hrpa0022.schcd,
    hrpa0022.faccd,
    hrpa0022.dptmt,
    hrpa0022.emark,
    hrpa0022.yycerttitle,
    hrpa0022.yyawards,
    hrpa0022.yyscyear,
    hrpa0022.yysubbranch
from db_koandina_regional_analyticssec.hrpa0022_analyticssec hrpa0022
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrpa0022.pernr = hrpa0001.pernr