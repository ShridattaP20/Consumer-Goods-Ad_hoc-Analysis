-- 6.Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct 
--   for the fiscal year 2021 and in the Indian market.
select 
	customer_code, 
    customer, concat(round(avg(pre_invoice_discount_pct)*100,2),'%') as  average_pre_inv_discount_percentage
from fact_pre_invoice_deductions
join dim_customer 
using(customer_code)
where fiscal_year=2021 and market='India'
group by customer_code
order by pre_invoice_discount_pct desc
limit 5;