CREATE OR REPLACE VIEW db_koandina_ar_analytics.vw_ar_comp_code_text_analytics AS
select
    comp_code_text.key1,
    comp_code_text.txtmd,
    comp_code_text.langu
from db_koandina_regional_analytics.comp_code_text_analytics comp_code_text
where key1 in ('3047')