CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrp1002_analyticssec AS
select
    hrp1002.PLVAR,
    hrp1002.OTYPE,
    hrp1002.OBJID,
    hrp1002.SUBTY,
    hrp1002.ISTAT,
    hrp1002.BEGDA,
    hrp1002.ENDDA,
    hrp1002.LANGU,
    hrp1002.FILLER,
    hrp1002.SEQNR,
    hrp1002.INFTY,
    hrp1002.OTJID,
    hrp1002.AEDTM,
    hrp1002.UNAME,
    hrp1002.REASN,
    hrp1002.HISTO,
    hrp1002.ITXNR,
    hrp1002.TABNR
from db_koandina_regional_analyticssec.hrp1002_analyticssec hrp1002
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on hrp1002.pernr = hrpa0001.pernr