CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrp5007_analyticssec AS
select
    hrp5007.PLVAR,
    hrp5007.OTYPE,
    hrp5007.OBJID,
    hrp5007.SUBTY,
    hrp5007.ISTAT,
    hrp5007.BEGDA,
    hrp5007.ENDDA,
    hrp5007.VARYF,
    hrp5007.SEQNR,
    hrp5007.INFTY,
    hrp5007.OTJID,
    hrp5007.AEDTM,
    hrp5007.UNAME,
    hrp5007.REASN,
    hrp5007.HISTO,
    hrp5007.ITXNR,
    hrp5007.TFORM
from db_koandina_regional_analyticssec.hrp5007_analyticssec hrp5007
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on hrp5007.pernr = hrpa0001.pernr