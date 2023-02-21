CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrp1001_analyticssec AS
select
    hrp1001.otype,
    hrp1001.objid,
    hrp1001.plvar,
    hrp1001.rsign,
    hrp1001.relat,
    hrp1001.istat,
    hrp1001.priox,
    hrp1001.begda,
    hrp1001.endda,
    hrp1001.varyf,
    hrp1001.seqnr,
    hrp1001.infty,
    hrp1001.otjid,
    hrp1001.subty,
    hrp1001.aedtm,
    hrp1001.uname,
    hrp1001.reasn,
    hrp1001.histo,
    hrp1001.itxnr,
    hrp1001.sclas,
    hrp1001.sobid,
    hrp1001.prozt,
    hrp1001.adatanr
from db_koandina_regional_analyticssec.hrp1001_analyticssec hrp1001
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrp1001.pernr = hrpa0001.pernr