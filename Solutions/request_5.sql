-- 5. Get the products that have the highest and lowest manufacturing costs.
select 
	F.product_code, 
    P.product, F.manufacturing_cost 
from fact_manufacturing_cost F JOIN dim_product P
on F.product_code = P.product_code
where manufacturing_cost
in (
	select MAX(manufacturing_cost) from fact_manufacturing_cost
    union
    select MIN(manufacturing_cost) from fact_manufacturing_cost
    ) 
order by manufacturing_cost desc ;