-- 4.Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?
With seg_2020 as (
	select 
		segment, 
        count(distinct product_code) as uni_seg_2020
	from dim_product
	join fact_sales_monthly 
	using(product_code)
	where fiscal_year=2020
	group by segment
),
seg_2021 as(
	select 
		segment, 
        count(distinct product_code) as uni_seg_2021
	from dim_product
	join fact_sales_monthly 
	using(product_code)
	where fiscal_year=2021
	group by segment
)
select 
	segment,
    uni_seg_2021 as product_count_2021, 
    uni_seg_2020 as product_count_2020, 
    uni_seg_2021 - uni_seg_2020 as  diff
from seg_2020 
join seg_2021 using(segment)
group by segment
order by diff desc;
