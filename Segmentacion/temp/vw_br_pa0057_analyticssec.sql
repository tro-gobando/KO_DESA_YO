CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hrpa0057_analyticssec AS
select
PA0057.pernr,               
PA0057.subty,               
PA0057.objps,               
PA0057.sprps,               
PA0057.endda,               
PA0057.begda,               
PA0057.seqnr,               
PA0057.aedtm,               
PA0057.uname,               
PA0057.histo,               
PA0057.itxex,               
PA0057.refex,               
PA0057.ordex,               
PA0057.itbld,               
PA0057.preas,               
PA0057.flag1,               
PA0057.flag2,               
PA0057.flag3,               
PA0057.flag4,               
PA0057.rese1,               
PA0057.rese2,               
PA0057.grpvl,               
PA0057.emfsl,               
PA0057.mtgln,               
PA0057.grprg,               
PA0057.betrg,               
PA0057.waers,               
PA0057.lgart,               
PA0057.anzhl,               
PA0057.zeinh,               
PA0057.zfper,               
PA0057.zdate,               
PA0057.zanzl,               
PA0057.zeinz,               
PA0057.prity,               
PA0057.ufunc,               
PA0057.unloc,               
PA0057.ustat,               
PA0057.esrnr,               
PA0057.esrre,               
PA0057.esrpz,               
PA0057.zweck,               
PA0057.opken,               
PA0057.indbw,               
PA0057.zschl,               
PA0057.uwdat,               
PA0057.model,               
PA0057.mgart,               
PA0057.bkref  
from db_koandina_regional_analyticssec.hrPA0057_analyticssec PA0057
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on PA0057.pernr = hrpa0001.pernr