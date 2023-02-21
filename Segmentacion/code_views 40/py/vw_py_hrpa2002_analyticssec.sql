CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrpa2002_analyticssec AS
select
    hrpa2002.pernr,
    hrpa2002.subty,
    hrpa2002.objps,
    hrpa2002.sprps,
    hrpa2002.endda,
    hrpa2002.begda,
    hrpa2002.seqnr,
    hrpa2002.aedtm,
    hrpa2002.uname,
    hrpa2002.histo,
    hrpa2002.itxex,
    hrpa2002.refex,
    hrpa2002.ordex,
    hrpa2002.itbld,
    hrpa2002.preas,
    hrpa2002.flag1,
    hrpa2002.flag2,
    hrpa2002.flag3,
    hrpa2002.flag4,
    hrpa2002.rese1,
    hrpa2002.rese2,
    hrpa2002.grpvl,
    hrpa2002.beguz,
    hrpa2002.enduz,
    hrpa2002.vtken,
    hrpa2002.awart,
    hrpa2002.abwtg,
    hrpa2002.abrtg,
    hrpa2002.abrst,
    hrpa2002.kaltg,
    hrpa2002.stdaz,
    hrpa2002.lgart,
    hrpa2002.bwgrl,
    hrpa2002.aufkz,
    hrpa2002.versl,
    hrpa2002.trfgr,
    hrpa2002.trfst,
    hrpa2002.prakn,
    hrpa2002.prakz,
    hrpa2002.otype,
    hrpa2002.plans,
    hrpa2002.gener,
    hrpa2002.exbel,
    hrpa2002.hrsif,
    hrpa2002.alldf,
    hrpa2002.waers,
    hrpa2002.logsys,
    hrpa2002.awtyp,
    hrpa2002.awref,
    hrpa2002.aworg,
    hrpa2002.docsy,
    hrpa2002.docnr,
    hrpa2002.wtart,
    hrpa2002.faprs,
    hrpa2002.tdlangu,
    hrpa2002.tdsubla,
    hrpa2002.tdtype,
    hrpa2002.kepau,
    hrpa2002.expau,
    hrpa2002.pbeg1,
    hrpa2002.pend1,
    hrpa2002.pbez1,
    hrpa2002.punb1,
    hrpa2002.pbeg2,
    hrpa2002.pend2,
    hrpa2002.pbez2,
    hrpa2002.punb2,
    hrpa2002.nxdfl
from db_koandina_regional_analyticssec.hrpa2002_analyticssec hrpa2002
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on hrpa2002.pernr = hrpa0001.pernr