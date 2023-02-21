CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hr_hrp1008_analyticssec AS
select
    hrp1008.PLVAR,
    hrp1008.OTYPE,
    hrp1008.OBJID,
    hrp1008.SUBTY,
    hrp1008.ISTAT,
    hrp1008.BEGDA,
    hrp1008.ENDDA,
    hrp1008.VARYF,
    hrp1008.SEQNR,
    hrp1008.INFTY,
    hrp1008.OTJID,
    hrp1008.AEDTM,
    hrp1008.UNAME,
    hrp1008.REASN,
    hrp1008.HISTO,
    hrp1008.ITXNR,
    hrp1008.BUKRS,
    hrp1008.GSBER,
    hrp1008.WERKS,
    hrp1008.PERSA,
    hrp1008.BTRTL,
    hrp1008.KOKRS
from db_koandina_regional_analyticssec.hrp1008_analyticssec hrp1008
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrp1008.pernr = hrpa0001.pernr