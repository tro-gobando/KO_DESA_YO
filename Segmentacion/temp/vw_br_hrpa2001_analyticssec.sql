CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hrpa2001_analyticssec AS
select
    hrpa2001.pernr,
    hrpa2001.subty,
    hrpa2001.objps,
    hrpa2001.sprps,
    hrpa2001.endda,
    hrpa2001.begda,
    hrpa2001.seqnr,
    hrpa2001.aedtm,
    hrpa2001.uname,
    hrpa2001.histo,
    hrpa2001.itxex,
    hrpa2001.refex,
    hrpa2001.ordex,
    hrpa2001.itbld,
    hrpa2001.preas,
    hrpa2001.flag1,
    hrpa2001.flag2,
    hrpa2001.flag3,
    hrpa2001.flag4,
    hrpa2001.rese1,
    hrpa2001.rese2,
    hrpa2001.grpvl,
    hrpa2001.beguz,
    hrpa2001.enduz,
    hrpa2001.vtken,
    hrpa2001.awart,
    hrpa2001.abwtg,
    hrpa2001.stdaz,
    hrpa2001.abrtg,
    hrpa2001.abrst,
    hrpa2001.anrtg,
    hrpa2001.lfzed,
    hrpa2001.krged,
    hrpa2001.kbbeg,
    hrpa2001.rmdda,
    hrpa2001.kenn1,
    hrpa2001.kenn2,
    hrpa2001.kaltg,
    hrpa2001.urman,
    hrpa2001.begva,
    hrpa2001.bwgrl,
    hrpa2001.aufkz,
    hrpa2001.trfgr,
    hrpa2001.trfst,
    hrpa2001.prakn,
    hrpa2001.prakz,
    hrpa2001.otype,
    hrpa2001.plans,
    hrpa2001.mldda,
    hrpa2001.mlduz,
    hrpa2001.rmduz,
    hrpa2001.vorgs,
    hrpa2001.umskd,
    hrpa2001.umsch,
    hrpa2001.refnr,
    hrpa2001.unfal,
    hrpa2001.stkrv,
    hrpa2001.stund,
    hrpa2001.psarb,
    hrpa2001.ainft,
    hrpa2001.gener,
    hrpa2001.hrsif,
    hrpa2001.alldf,
    hrpa2001.waers,
    hrpa2001.logsys,
    hrpa2001.awtyp,
    hrpa2001.awref,
    hrpa2001.aworg,
    hrpa2001.docsy,
    hrpa2001.docnr,
    hrpa2001.payty,
    hrpa2001.payid,
    hrpa2001.bondt,
    hrpa2001.ocrsn,
    hrpa2001.sppe1,
    hrpa2001.sppe2,
    hrpa2001.sppe3,
    hrpa2001.sppin,
    hrpa2001.zkmkt,
    hrpa2001.faprs,
    hrpa2001.tdlangu,
    hrpa2001.tdsubla,
    hrpa2001.tdtype,
    hrpa2001.nxdfl
from db_koandina_regional_analyticssec.hrpa2001_analyticssec hrpa2001
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrpa2001.pernr = hrpa0001.pernr