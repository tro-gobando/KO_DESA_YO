CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0032_analyticssec AS
select
PA0032.pernr,
PA0032.subty,
PA0032.objps,
PA0032.sprps,
PA0032.endda,
PA0032.begda,
PA0032.seqnr,
PA0032.aedtm,
PA0032.uname,
PA0032.histo,
PA0032.itxex,
PA0032.refex,
PA0032.ordex,
PA0032.itbld,
PA0032.preas,
PA0032.flag1,
PA0032.flag2,
PA0032.flag3,
PA0032.flag4,
PA0032.rese1,
PA0032.rese2,
PA0032.grpvl,
PA0032.pnalt,
PA0032.wausw,
PA0032.pkwrg,
PA0032.pkwwr,
PA0032.kfzkz,
PA0032.waers,
PA0032.anlnr,
PA0032.gebnr,
PA0032.zimnr,
PA0032.tel01,
PA0032.tel02,
PA0032.com01,
PA0032.num01,
PA0032.com02,
PA0032.num02,
PA0032.com03,
PA0032.num03,
PA0032.com04,
PA0032.num04,
PA0032.com05,
PA0032.num05,
PA0032.com06,
PA0032.num06,
PA0032.coletor1,
PA0032.descricao1,
PA0032.natureza1,
PA0032.coletor2,
PA0032.descricao2,
PA0032.natureza2,
PA0032.coletor3,
PA0032.descricao3,
PA0032.natureza3,
PA0032.coletor4,
PA0032.descricao4,
PA0032.natureza4,
PA0032.coletor5,
PA0032.descricao5,
PA0032.natureza5,
PA0032.coletor6,
PA0032.descricao6,
PA0032.natureza6,
PA0032.coletor7,
PA0032.descricao7,
PA0032.natureza7,
PA0032.coletor8,
PA0032.descricao8,
PA0032.natureza8,
PA0032.coletor9,
PA0032.descricao9,
PA0032.natureza9,
PA0032.coletor10,
PA0032.descricao10,
PA0032.natureza10,
PA0032.coletor11,
PA0032.descrica11,
PA0032.natureza11,
PA0032.coletor12,
PA0032.descrica12,
PA0032.natureza12,
PA0032.coletor13,
PA0032.descrica13,
PA0032.natureza13,
PA0032.coletor14,
PA0032.descricao14,
PA0032.natureza14,
PA0032.coletor15,
PA0032.descricao15,
PA0032.natureza15,
PA0032.coletor16,
PA0032.descricao16,
PA0032.natureza16,
PA0032.coletor17,
PA0032.descricao17,
PA0032.natureza17,
PA0032.coletor18,
PA0032.descricao18,
PA0032.natureza18,
PA0032.coletor19,
PA0032.descricao19,
PA0032.natureza19,
PA0032.coletor20,
PA0032.descricao20,
PA0032.natureza20,
PA0032.counter
from db_koandina_regional_analyticssec.hrPA0032_analyticssec PA0032
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on PA0032.pernr = hrpa0001.pernr