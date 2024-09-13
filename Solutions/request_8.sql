-- 8.In which quarter of 2020, got the maximum total_sold_quantity?
with cte as(
	SELECT 
		date,
        date_add(date,interval 4 month) AS new_date, fiscal_year,sold_quantity 
        /* Fiscal year for AtliQ hardware starts from september to august */
	FROM fact_sales_monthly
)
select 
	concat('Q',quarter(new_date)) as quater, 
    concat(round(sum(sold_quantity)/1000000,2),' ','M') as total_quantity_sold
from cte
where fiscal_year=2020
group by quater;