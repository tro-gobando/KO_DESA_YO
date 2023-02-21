CREATE OR REPLACE VIEW db_koandina_regional_analyticssec.vw_reg_hrt1002_analyticssec AS
select
    hrt1002.TABNR,
    hrt1002.TABSEQNR,
    hrt1002.TLINE,
    hrt1002.TFORMAT
from db_koandina_regional_analyticssec.hrt1002_analyticssec hrt1002