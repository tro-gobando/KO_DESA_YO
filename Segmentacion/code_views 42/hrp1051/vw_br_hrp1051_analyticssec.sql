CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hr_hrp1051_analyticssec AS
select
    hrp1051.PLVAR,
    hrp1051.OTYPE,
    hrp1051.OBJID,
    hrp1051.SUBTY,
    hrp1051.ISTAT,
    hrp1051.BEGDA,
    hrp1051.ENDDA,
    hrp1051.VARYF,
    hrp1051.SEQNR,
    hrp1051.INFTY,
    hrp1051.OTJID,
    hrp1051.AEDTM,
    hrp1051.UNAME,
    hrp1051.REASN,
    hrp1051.HISTO,
    hrp1051.ITXNR,
    hrp1051.JCODE,
    hrp1051.MABAS,
    hrp1051.MABAM,
    hrp1051.MABPC,
    hrp1051.WAERS,
    hrp1051.PERIO
from db_koandina_regional_analyticssec.hrp1051_analyticssec hrp1051
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrp1051.pernr = hrpa0001.pernr