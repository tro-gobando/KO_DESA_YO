CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrpa0394_analyticssec AS
select
    hrpa0394.pernr,
    hrpa0394.subty,
    hrpa0394.objps,
    hrpa0394.sprps,
    hrpa0394.endda,
    hrpa0394.begda,
    hrpa0394.seqnr,
    hrpa0394.aedtm,
    hrpa0394.uname,
    hrpa0394.histo,
    hrpa0394.itxex,
    hrpa0394.refex,
    hrpa0394.ordex,
    hrpa0394.itbld,
    hrpa0394.preas,
    hrpa0394.flag1,
    hrpa0394.flag2,
    hrpa0394.flag3,
    hrpa0394.flag4,
    hrpa0394.rese1,
    hrpa0394.rese2,
    hrpa0394.grpvl,
    hrpa0394.asfax,
    hrpa0394.discp,
    hrpa0394.traba,
    hrpa0394.estud,
    hrpa0394.feinf,
    hrpa0394.nadoc,
    hrpa0394.famst,
    hrpa0394.adhos,
    hrpa0394.clase,
    hrpa0394.ccuil,
    hrpa0394.ictyp,
    hrpa0394.icnum,
    hrpa0394.tipoe
from db_koandina_regional_analyticssec.hrpa0394_analyticssec hrpa0394
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on hrpa0394.pernr = hrpa0001.pernr