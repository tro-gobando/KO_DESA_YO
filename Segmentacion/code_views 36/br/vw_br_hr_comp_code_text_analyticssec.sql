CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_hr_comp_code_text_analyticssec AS
select
    comp_code_text.key1,
    comp_code_text.txtmd,
    comp_code_text.langu
from db_koandina_regional_analyticssec.comp_code_text_analytics
where key1 in ('3048')