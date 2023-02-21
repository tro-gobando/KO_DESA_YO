CREATE OR REPLACE VIEW db_koandina_br_analyticssec.vw_br_costcenter_text_analyticssec AS
select
    costcenter_text.langu,
    costcenter_text.kokrs,
    costcenter_text.kostl,
    costcenter_text.dateto,
    costcenter_text.datefrom,
    costcenter_text.txtsh,
    costcenter_text.txtmd,
    costcenter_text.txtmc
from db_koandina_regional_analyticssec.costcenter_text_analytics costcenter_text
where kokrs in ('BR00')