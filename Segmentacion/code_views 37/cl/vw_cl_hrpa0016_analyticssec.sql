CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0016_analyticssec AS
select
    hrpa0016.pernr,
    hrpa0016.subty,
    hrpa0016.objps,
    hrpa0016.sprps,
    hrpa0016.endda,
    hrpa0016.begda,
    hrpa0016.seqnr,
    hrpa0016.aedtm,
    hrpa0016.uname,
    hrpa0016.histo,
    hrpa0016.itxex,
    hrpa0016.refex,
    hrpa0016.ordex,
    hrpa0016.itbld,
    hrpa0016.preas,
    hrpa0016.flag1,
    hrpa0016.flag2,
    hrpa0016.flag3,
    hrpa0016.flag4,
    hrpa0016.rese1,
    hrpa0016.rese2,
    hrpa0016.grpvl,
    hrpa0016.nbtgk,
    hrpa0016.wttkl,
    hrpa0016.lfzfr,
    hrpa0016.lfzzh,
    hrpa0016.lfzso,
    hrpa0016.kgzfr,
    hrpa0016.kgzzh,
    hrpa0016.prbzt,
    hrpa0016.prbeh,
    hrpa0016.kdgfr,
    hrpa0016.kdgf2,
    hrpa0016.arber,
    hrpa0016.eindt,
    hrpa0016.kondt,
    hrpa0016.konsl,
    hrpa0016.cttyp,
    hrpa0016.ctedt,
    hrpa0016.persg,
    hrpa0016.persk,
    hrpa0016.wrkpl,
    hrpa0016.ctbeg,
    hrpa0016.ctnum,
    hrpa0016.objnb,
    hrpa0016.zzmemo_ing,
    hrpa0016.zzmemo_egr,
    hrpa0016.zind,
    hrpa0016.zinsal
from db_koandina_regional_analyticssec.hrpa0016_analyticssec hrpa0016
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrpa0016.pernr = hrpa0001.pernr