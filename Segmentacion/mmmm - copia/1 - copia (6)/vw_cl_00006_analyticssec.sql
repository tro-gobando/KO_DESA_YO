CREATE OR REPLACE VIEW db_koandina_cl_analyticssec.vw_cl_00006_analyticssec AS
select
00006.

from db_koandina_regional_analyticssec.00006_analyticssec 00006
inner join db_koandina_cl_analyticssec.vw_cl_hrpa0001_analyticssec hrpa0001 on 00006.pernr = hrpa0001.pernr