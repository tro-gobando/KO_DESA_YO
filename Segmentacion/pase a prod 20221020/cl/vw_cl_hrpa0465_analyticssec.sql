CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpa0465_analyticssec AS
select
    hrpa0465.pernr,
    hrpa0465.subty,
    hrpa0465.objps,
    hrpa0465.sprps,
    hrpa0465.endda,
    hrpa0465.begda,
    hrpa0465.seqnr,
    hrpa0465.aedtm,
    hrpa0465.uname,
    hrpa0465.histo,
    hrpa0465.itxex,
    hrpa0465.refex,
    hrpa0465.ordex,
    hrpa0465.itbld,
    hrpa0465.preas,
    hrpa0465.flag1,
    hrpa0465.flag2,
    hrpa0465.flag3,
    hrpa0465.flag4,
    hrpa0465.rese1,
    hrpa0465.rese2,
    hrpa0465.grpvl,
    hrpa0465.tpdoc,
    hrpa0465.dt_emis,
    hrpa0465.es_emis,
    hrpa0465.cpf_nr,
    hrpa0465.ident_nr,
    hrpa0465.ident_org,
    hrpa0465.ctps_nr,
    hrpa0465.ctps_serie,
    hrpa0465.creg_nr,
    hrpa0465.creg_name,
    hrpa0465.creg_init,
    hrpa0465.elec_nr,
    hrpa0465.elec_zone,
    hrpa0465.elec_sect,
    hrpa0465.pis_nr,
    hrpa0465.mil_nr,
    hrpa0465.mil_type,
    hrpa0465.mil_cat,
    hrpa0465.idfor_nr,
    hrpa0465.visa_nr,
    hrpa0465.visa_type,
    hrpa0465.marry_br,
    hrpa0465.dt_arrv,
    hrpa0465.drive_nr,
    hrpa0465.drive_cat,
    hrpa0465.passp_nr,
    hrpa0465.nit_nr,
    hrpa0465.carto,
    hrpa0465.cdeat,
    hrpa0465.death,
    hrpa0465.caude,
    hrpa0465.childbr,
    hrpa0465.doc_issuer,
    hrpa0465.doc_nr,
    hrpa0465.foreign_sit
from db_koandina_regional_analyticssec.hrpa0465_analyticssec hrpa0465
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on hrpa0465.pernr = hrpa0001.pernr