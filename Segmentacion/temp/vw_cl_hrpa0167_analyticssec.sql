CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0167_analyticssec AS
select
    hrpa0167.pernr,
    hrpa0167.subty,
    hrpa0167.objps,
    hrpa0167.sprps,
    hrpa0167.endda,
    hrpa0167.begda,
    hrpa0167.seqnr,
    hrpa0167.aedtm,
    hrpa0167.uname,
    hrpa0167.histo,
    hrpa0167.itxex,
    hrpa0167.refex,
    hrpa0167.ordex,
    hrpa0167.itbld,
    hrpa0167.preas,
    hrpa0167.flag1,
    hrpa0167.flag2,
    hrpa0167.flag3,
    hrpa0167.flag4,
    hrpa0167.rese1,
    hrpa0167.rese2,
    hrpa0167.grpvl,
    hrpa0167.barea,
    hrpa0167.pltyp,
    hrpa0167.bplan,
    hrpa0167.bengr,
    hrpa0167.bstat,
    hrpa0167.elidt,
    hrpa0167.eldto,
    hrpa0167.pardt,
    hrpa0167.bopti,
    hrpa0167.depcv,
    hrpa0167.coord,
    hrpa0167.provi,
    hrpa0167.polnr,
    hrpa0167.enrty,
    hrpa0167.event,
    hrpa0167.eogrp,
    hrpa0167.eoirq,
    hrpa0167.eoipr,
    hrpa0167.pretx,
    hrpa0167.cstov,
    hrpa0167.bncst,
    hrpa0167.perio,
    hrpa0167.curre,
    hrpa0167.dty01,
    hrpa0167.did01,
    hrpa0167.dty02,
    hrpa0167.did02,
    hrpa0167.dty03,
    hrpa0167.did03,
    hrpa0167.dty04,
    hrpa0167.did04,
    hrpa0167.dty05,
    hrpa0167.did05,
    hrpa0167.dty06,
    hrpa0167.did06,
    hrpa0167.dty07,
    hrpa0167.did07,
    hrpa0167.dty08,
    hrpa0167.did08,
    hrpa0167.dty09,
    hrpa0167.did09,
    hrpa0167.dty10,
    hrpa0167.did10,
    hrpa0167.dty11,
    hrpa0167.did11,
    hrpa0167.dty12,
    hrpa0167.did12,
    hrpa0167.dty13,
    hrpa0167.did13,
    hrpa0167.dty14,
    hrpa0167.did14,
    hrpa0167.dty15,
    hrpa0167.did15,
    hrpa0167.dty16,
    hrpa0167.did16,
    hrpa0167.dty17,
    hrpa0167.did17,
    hrpa0167.dty18,
    hrpa0167.did18,
    hrpa0167.dty19,
    hrpa0167.did19,
    hrpa0167.dty20,
    hrpa0167.did20
from db_koandina_regional_analyticssec.hrpa0167_analyticssec hrpa0167
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrpa0167.pernr = hrpa0001.pernr