CREATE OR REPLACE VIEW db_koandina_ar_analyticssec.vw_ar_hrp1025_analyticssec AS
select
    hrp1025.PLVAR,
    hrp1025.OTYPE,
    hrp1025.OBJID,
    hrp1025.SUBTY,
    hrp1025.ISTAT,
    hrp1025.BEGDA,
    hrp1025.ENDDA,
    hrp1025.VARYF,
    hrp1025.SEQNR,
    hrp1025.INFTY,
    hrp1025.OTJID,
    hrp1025.AEDTM,
    hrp1025.UNAME,
    hrp1025.REASN,
    hrp1025.HISTO,
    hrp1025.ITXNR,
    hrp1025.NYEARS,
    hrp1025.NMONTHS,
    hrp1025.N_TYPE
from db_koandina_regional_analyticssec.hrp1025_analyticssec hrp1025
inner join db_koandina_ar_analyticssec.vw_ar_hrpa0001_analyticssec hrpa0001 on hrp1025.pernr = hrpa0001.pernr