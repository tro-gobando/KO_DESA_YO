CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrp1042_analyticssec AS
select
    hrp1042.plvar,
    hrp1042.otype,
    hrp1042.objid,
    hrp1042.subty,
    hrp1042.istat,
    hrp1042.begda,
    hrp1042.endda,
    hrp1042.varyf,
    hrp1042.seqnr,
    hrp1042.infty,
    hrp1042.otjid,
    hrp1042.aedtm,
    hrp1042.uname,
    hrp1042.reasn,
    hrp1042.histo,
    hrp1042.itxnr,
    hrp1042.aclas,
    hrp1042.amust,
    hrp1042.refak,
    hrp1042.bgday,
    hrp1042.rday1,
    hrp1042.rday2,
    hrp1042.rday3,
    hrp1042.rday4,
    hrp1042.rdayl,
    hrp1042.refrq,
    hrp1042.ndays,
    hrp1042.nhours,
    hrp1042.tabnr
from db_koandina_regional_analyticssec.hrp1042_analyticssec hrp1042
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrp1042.pernr = hrpa0001.pernr