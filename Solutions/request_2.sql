-- 2. What is the percentage of unique product increase in 2021 vs. 2020?
With pro_2020 as (
	select 
		count(distinct product_code) as uni_2020
	from fact_sales_monthly
	where fiscal_year=2020
	),
pro_2021 as(
	select
		count(distinct product_code) as uni_2021
	from fact_sales_monthly
	where fiscal_year=2021
	)
select 
	uni_2020 as unique_product_2020, 
    uni_2021 as unique_product_2021,
    round(100 * (uni_2021-uni_2020)/uni_2020,2) as pct_change
from pro_2020 
join pro_2021 ;