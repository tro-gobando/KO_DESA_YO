CREATE OR REPLACE VIEW db_koandina_ar_analyticssec.vw_ar_hrlsoava_analyticssec AS
select
    hrlsoava.OBJID,
    hrlsoava.PERNR,
    hrlsoava.ZNOTA
from db_koandina_regional_analyticssec.hrlsoava_analyticssec hrlsoava
inner join db_koandina_ar_analyticssec.vw_ar_hrpa0001_analyticssec hrpa0001 on hrlsoava.pernr = hrpa0001.pernr