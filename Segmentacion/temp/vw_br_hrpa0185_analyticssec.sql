CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hrpa0185_analyticssec AS
select
    hrpa0185.pernr,
    hrpa0185.subty,
    hrpa0185.objps,
    hrpa0185.sprps,
    hrpa0185.endda,
    hrpa0185.begda,
    hrpa0185.seqnr,
    hrpa0185.aedtm,
    hrpa0185.uname,
    hrpa0185.histo,
    hrpa0185.itxex,
    hrpa0185.refex,
    hrpa0185.ordex,
    hrpa0185.itbld,
    hrpa0185.preas,
    hrpa0185.flag1,
    hrpa0185.flag2,
    hrpa0185.flag3,
    hrpa0185.flag4,
    hrpa0185.rese1,
    hrpa0185.rese2,
    hrpa0185.grpvl,
    hrpa0185.ictyp,
    hrpa0185.icnum,
    hrpa0185.icold,
    hrpa0185.auth1,
    hrpa0185.docn1,
    hrpa0185.fpdat,
    hrpa0185.expid,
    hrpa0185.isspl,
    hrpa0185.iscot,
    hrpa0185.idcot,
    hrpa0185.ovchk,
    hrpa0185.astat,
    hrpa0185.akind,
    hrpa0185.rejec,
    hrpa0185.usefr,
    hrpa0185.useto,
    hrpa0185.daten,
    hrpa0185.dateu,
    hrpa0185.times
from db_koandina_regional_analyticssec.hrpa0185_analyticssec hrpa0185
inner join db_koandina_br_analyticssec.vw_br_hrpa0001_analyticssec hrpa0001 on hrpa0185.pernr = hrpa0001.pernr