CREATE OR REPLACE VIEW db_koandina_py_analyticssec.vw_py_hrt1002_analyticssec AS
select
    hrt1002.TABNR,
    hrt1002.TABSEQNR,
    hrt1002.TLINE,
    hrt1002.TFORMAT
from db_koandina_regional_analyticssec.hrt1002_analyticssec hrt1002
inner join db_koandina_py_analyticssec.vw_py_hrpa0001_analyticssec hrpa0001 on hrt1002.pernr = hrpa0001.pernr