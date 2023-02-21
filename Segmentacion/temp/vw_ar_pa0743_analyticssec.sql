CREATE OR REPLACE VIEW db_koandina_ar_analyticssec.vw_ar_hrpa0743_analyticssec AS
select
PA0743.pernr,
PA0743.subty,
PA0743.objps,
PA0743.sprps,
PA0743.endda,
PA0743.begda,
PA0743.seqnr,
PA0743.aedtm,
PA0743.uname,
PA0743.histo,
PA0743.itxex,
PA0743.refex,
PA0743.ordex,
PA0743.itbld,
PA0743.preas,
PA0743.flag1,
PA0743.flag2,
PA0743.flag3,
PA0743.flag4,
PA0743.rese1,
PA0743.rese2,
PA0743.grpvl,
PA0743.inty1,
PA0743.inbd1,
PA0743.ined1,
PA0743.inre1,
PA0743.inat1,
PA0743.inty2,
PA0743.inbd2,
PA0743.ined2,
PA0743.inre2,
PA0743.inat2,
PA0743.inty3,
PA0743.inbd3,
PA0743.ined3,
PA0743.inre3,
PA0743.inat3,
PA0743.inty4,
PA0743.inbd4,
PA0743.ined4,
PA0743.inre4,
PA0743.inat4,
PA0743.inty5,
PA0743.inbd5,
PA0743.ined5,
PA0743.inre5,
PA0743.inat5,
PA0743.offdt,
PA0743.diacd,
PA0743.invdt,
PA0743.dakcr,
PA0743.offc1,
PA0743.offc2,
PA0743.offc3,
PA0743.offc4,
PA0743.offc5,
PA0743.heabd,
PA0743.heaed,
PA0743.invpr,
PA0743.coip1,
PA0743.coin1,
PA0743.coip2,
PA0743.coin2,
PA0743.coip3,
PA0743.coin3,
PA0743.typer,
PA0743.reppr,
PA0743.repna,
PA0743.minpr,
PA0743.dackp,
PA0743.oucd1,
PA0743.oude1,
PA0743.oudf1,
PA0743.oudr1,
PA0743.oumt1,
PA0743.ouat1,
PA0743.oupr1,
PA0743.ouin1,
PA0743.ound1,
PA0743.oucd2,
PA0743.oude2,
PA0743.oudf2,
PA0743.oudr2,
PA0743.oumt2,
PA0743.ouat2,
PA0743.oupr2,
PA0743.ouin2,
PA0743.ound2,
PA0743.oucd3,
PA0743.oude3,
PA0743.oudf3,
PA0743.oudr3,
PA0743.oumt3,
PA0743.ouat3,
PA0743.oupr3,
PA0743.ouin3,
PA0743.ound3,
PA0743.waers,
PA0743.coim1,
PA0743.coim2
from db_koandina_regional_analyticssec.hrPA0743_analyticssec PA0743
inner join db_koandina_ar_analyticssec.vw_ar_hrpa0001_analyticssec hrpa0001 on PA0743.pernr = hrpa0001.pernr