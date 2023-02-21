CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0048_analyticssec AS
select
    hrpa0048.PERNR,
    hrpa0048.SUBTY,
    hrpa0048.OBJPS,
    hrpa0048.SPRPS,
    hrpa0048.ENDDA,
    hrpa0048.BEGDA,
    hrpa0048.SEQNR,
    hrpa0048.AEDTM,
    hrpa0048.UNAME,
    hrpa0048.HISTO,
    hrpa0048.ITXEX,
    hrpa0048.REFEX,
    hrpa0048.ORDEX,
    hrpa0048.ITBLD,
    hrpa0048.PREAS,
    hrpa0048.FLAG1,
    hrpa0048.FLAG2,
    hrpa0048.FLAG3,
    hrpa0048.FLAG4,
    hrpa0048.RESE1,
    hrpa0048.RESE2,
    hrpa0048.GRPVL,
    hrpa0048.ASTAT,
    hrpa0048.BEWNR,
    hrpa0048.ABLAD,
    hrpa0048.AUSGD,
    hrpa0048.AUSBE,
    hrpa0048.EINRD,
    hrpa0048.PASSN,
    hrpa0048.VISAT,
    hrpa0048.VISAS,
    hrpa0048.RSTUS,
    hrpa0048.PRFID,
    hrpa0048.PPLND,
    hrpa0048.WPFUN,
    hrpa0048.WPEND,
    hrpa0048.VIBEG,
    hrpa0048.REASP
from db_koandina_regional_analyticssec.hrpa0048_analyticssec hrpa0048
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrpa0048.pernr = hrpa0001.pernr