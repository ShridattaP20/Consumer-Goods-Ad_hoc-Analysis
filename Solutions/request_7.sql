-- 7.Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month .
select 
	monthname(fs.date) as month_name, 
    year(fs.date) as year, 
    concat(round(sum(gross_price * sold_quantity)/1000000,2),' ', 'M') as gross_sales
from fact_gross_price f 
join fact_sales_monthly fs using(product_code)
join dim_customer d using(customer_code)
where customer='Atliq Exclusive'
group by month_name , year
order by year asc;