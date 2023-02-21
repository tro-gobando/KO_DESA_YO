SELECT 
    ea.begda,
    ea.endda,
    ea.pernr,
    ea.rfpnr,
    ea.bukrs,
    ea.werks,
    ea.btrtl,
    ea.persg,
    ea.persk,
    ea.orgeh,
    ea.stell,
    ea.plans,
    ea.kokrs,
    ea.kostl,
    ea.abkrs,
    ea.molga,
    ea.trfar,
    ea.trfgb,
    ea.trfkz,
    ea.trfgr,
    ea.trfst,
    ea.bsgrd,
    ea.ancur,
    ea.empct,
    ea.stat2,
    ea.ncsdate,
    ea.sltyp,
    ea.slreg,
    ea.slgrp,
    ea.sllev,
    ea.ansvh,
    ea.vdsk1,
    ea.sname,
    ea.cpind,
    ea.bigesg,
    ea.bigelv,
    ea.bigpsg,
    ea.teilk,
    ea.plant
FROM db_koandina_regional_stage.employee_attr_stagesec ea
WHERE ea.bukrs in ('3049')                          -- 'Paraguay'
