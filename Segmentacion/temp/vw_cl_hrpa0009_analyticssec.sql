CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0009_analyticssec AS
select
    hrpa0009.pernr,
    hrpa0009.subty,
    hrpa0009.objps,
    hrpa0009.sprps,
    hrpa0009.endda,
    hrpa0009.begda,
    hrpa0009.seqnr,
    hrpa0009.aedtm,
    hrpa0009.uname,
    hrpa0009.histo,
    hrpa0009.itxex,
    hrpa0009.refex,
    hrpa0009.ordex,
    hrpa0009.itbld,
    hrpa0009.preas,
    hrpa0009.flag1,
    hrpa0009.flag2,
    hrpa0009.flag3,
    hrpa0009.flag4,
    hrpa0009.rese1,
    hrpa0009.rese2,
    hrpa0009.grpvl,
    hrpa0009.opken,
    hrpa0009.betrg,
    hrpa0009.waers,
    hrpa0009.anzhl,
    hrpa0009.zeinh,
    hrpa0009.bnksa,
    hrpa0009.zlsch,
    hrpa0009.emftx,
    hrpa0009.bkplz,
    hrpa0009.bkort,
    hrpa0009.banks,
    hrpa0009.bankl,
    hrpa0009.bankn,
    hrpa0009.bankp,
    hrpa0009.bkont,
    hrpa0009.swift,
    hrpa0009.dtaws,
    hrpa0009.dtams,
    hrpa0009.stcd1,
    hrpa0009.stcd2,
    hrpa0009.pskto,
    hrpa0009.esrnr,
    hrpa0009.esrre,
    hrpa0009.esrpz,
    hrpa0009.emfsl,
    hrpa0009.zweck,
    hrpa0009.bttyp,
    hrpa0009.payty,
    hrpa0009.payid,
    hrpa0009.ocrsn,
    hrpa0009.bondt,
    hrpa0009.bkref,
    hrpa0009.stras,
    hrpa0009.state,
    hrpa0009.debit,
    hrpa0009.iban,
    hrpa0009.adrs_banks
from db_koandina_regional_analyticssec.hrpa0009_analyticssec hrpa0009
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrpa0009.pernr = hrpa0001.pernr