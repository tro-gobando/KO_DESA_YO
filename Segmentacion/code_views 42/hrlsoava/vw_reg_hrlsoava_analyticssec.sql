CREATE OR REPLACE VIEW db_koandina_regional_analyticssec.vw_reg_hrlsoava_analyticssec AS
select
    hrlsoava.OBJID,
    hrlsoava.PERNR,
    hrlsoava.ZNOTA
from db_koandina_regional_analyticssec.hrlsoava_analyticssec hrlsoava