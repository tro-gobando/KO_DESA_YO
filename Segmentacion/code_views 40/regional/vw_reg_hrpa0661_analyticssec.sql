CREATE OR REPLACE VIEW db_koandina_regional_analyticssec.vw_reg_hrpa0661_analyticssec AS
select
    hrpa0661.pernr,
    hrpa0661.subty,
    hrpa0661.objps,
    hrpa0661.sprps,
    hrpa0661.endda,
    hrpa0661.begda,
    hrpa0661.seqnr,
    hrpa0661.aedtm,
    hrpa0661.uname,
    hrpa0661.histo,
    hrpa0661.itxex,
    hrpa0661.refex,
    hrpa0661.ordex,
    hrpa0661.itbld,
    hrpa0661.preas,
    hrpa0661.flag1,
    hrpa0661.flag2,
    hrpa0661.flag3,
    hrpa0661.flag4,
    hrpa0661.rese1,
    hrpa0661.rese2,
    hrpa0661.grpvl,
    hrpa0661.tipte,
    hrpa0661.eggrp,
    hrpa0661.waers,
    hrpa0661.preno,
    hrpa0661.preav,
    hrpa0661.preat,
    hrpa0661.fgtsb,
    hrpa0661.fgtsp,
    hrpa0661.fgtsr,
    hrpa0661.ar479,
    hrpa0661.dt479,
    hrpa0661.nd479,
    hrpa0661.coi01,
    hrpa0661.num01,
    hrpa0661.amt01,
    hrpa0661.pct01,
    hrpa0661.coi02,
    hrpa0661.num02,
    hrpa0661.amt02,
    hrpa0661.pct02,
    hrpa0661.coi03,
    hrpa0661.num03,
    hrpa0661.amt03,
    hrpa0661.pct03,
    hrpa0661.coi04,
    hrpa0661.num04,
    hrpa0661.amt04,
    hrpa0661.pct04,
    hrpa0661.coi05,
    hrpa0661.num05,
    hrpa0661.amt05,
    hrpa0661.pct05,
    hrpa0661.coi06,
    hrpa0661.num06,
    hrpa0661.amt06,
    hrpa0661.pct06,
    hrpa0661.coi07,
    hrpa0661.num07,
    hrpa0661.amt07,
    hrpa0661.pct07,
    hrpa0661.coi08,
    hrpa0661.num08,
    hrpa0661.amt08,
    hrpa0661.pct08,
    hrpa0661.coi09,
    hrpa0661.num09,
    hrpa0661.amt09,
    hrpa0661.pct09,
    hrpa0661.coi10,
    hrpa0661.num10,
    hrpa0661.amt10,
    hrpa0661.pct10,
    hrpa0661.coi11,
    hrpa0661.num11,
    hrpa0661.amt11,
    hrpa0661.pct11,
    hrpa0661.coi12,
    hrpa0661.num12,
    hrpa0661.amt12,
    hrpa0661.pct12,
    hrpa0661.coi13,
    hrpa0661.num13,
    hrpa0661.amt13
from db_koandina_regional_analyticssec.hrpa0661_analyticssec hrpa0661