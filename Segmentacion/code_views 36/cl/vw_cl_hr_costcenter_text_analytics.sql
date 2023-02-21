CREATE OR REPLACE VIEW db_koandina_cl_analytics.vw_cl_hr_costcenter_text_analytics AS
select
    costcenter_text.langu,
    costcenter_text.kokrs,
    costcenter_text.kostl,
    costcenter_text.dateto,
    costcenter_text.datefrom,
    costcenter_text.txtsh,
    costcenter_text.txtmd,
    costcenter_text.txtmc
from db_koandina_regional_analytics.costcenter_text_analytics costcenter_text
where kokrs in ('CL00')