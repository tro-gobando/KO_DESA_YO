CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrp1000_analyticssec AS
select
    hrp1000.otype,
    hrp1000.objid,
    hrp1000.plvar,
    hrp1000.rsign,
    hrp1000.relat,
    hrp1000.istat,
    hrp1000.priox,
    hrp1000.begda,
    hrp1000.endda,
    hrp1000.varyf,
    hrp1000.seqnr,
    hrp1000.infty,
    hrp1000.otjid,
    hrp1000.subty,
    hrp1000.aedtm,
    hrp1000.uname,
    hrp1000.reasn,
    hrp1000.histo,
    hrp1000.itxnr,
    hrp1000.sclas,
    hrp1000.sobid,
    hrp1000.prozt,
    hrp1000.adatanr
from db_koandina_regional_analyticssec.hrp1000_analyticssec hrp1000
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrp1000.pernr = hrpa0001.pernr