-- 9.Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?
with cte1 as (
	select 
		channel, 
        concat(round(sum(gross_price * sold_quantity)/1000000,2),' ', 'M') as gross_sales
	from fact_gross_price 
	join fact_sales_monthly  using(product_code)
	join dim_customer  using(customer_code)
	where fact_sales_monthly.fiscal_year=2021
	group by channel
),
cte2 as(
	select  
		sum(gross_sales) as total_sales
	from cte1
)
select 
	channel, 
	gross_sales, concat(round((gross_sales/total_sales)*100,2),'%') as pct_sharing
from cte1 join cte2
group by channel
order by pct_sharing desc;