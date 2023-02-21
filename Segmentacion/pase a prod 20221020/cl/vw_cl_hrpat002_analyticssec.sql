CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_hrpat002_analyticssec AS
select
    hrpat002.bukrs,
    hrpat002.pernr_boss,
    hrpat002.orgeh_padre,
    hrpat002.orgtx_padre,
    hrpat002.nivel,
    hrpat002.orgeh_hija,
    hrpat002.orgtx_hija
from db_koandina_regional_analyticssec.hrpat002_analyticssec hrpat002
where bukrs in ('3043','3044','3045','3050')