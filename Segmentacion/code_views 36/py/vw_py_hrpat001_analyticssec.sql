CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrpat001_analyticssec AS
select
    hrpat001.activo,
    hrpat001.bukrs,
    hrpat001.pernr,
    hrpat001.plans,
    hrpat001.plstx,
    hrpat001.orgeh,
    hrpat001.orgtx,
    hrpat001.pernr_boss,
    hrpat001.nombre_boss,
    hrpat001.plans_boss,
    hrpat001.plstx_boss,
    hrpat001.orgeh_boss,
    hrpat001.orgtx_boss
from db_koandina_regional_analyticssec.hrpat001_analyticssec hrpat001
where bukrs in ('3049')