create table Inventory_Data (
Product_type varchar(30),
SKU Varchar(20),
Stock_levels varchar(30),
Order_quantities int
);
Create table Logistics_Data (
SKU Varchar(20),
Shipping_times varchar(20),
Shipping_carriers varchar(20),
Shipping_costs varchar(30),
Transportation_modes varchar(30)
);
Create table Supplier_Data (
SKU varchar(30),
Supplier_name varchar(30),
Production_volumes varchar(30),
Manufacturing_leadtime varchar(30),
defect_rates numeric
);

/* Which low stock products are supplied by our slowest manufacturers */
select 
i.product_type,
sum(i.stock_levels::int) as total_stocks,
sum(i.order_quantities::int) as order_quantities,
s.supplier_name,
avg(s.manufacturing_leadtime::int) as lead_time
from inventory_data i
join supplier_data s
on
i.sku=s.sku
where i.stock_levels::int < i.order_quantities::int
group by i.product_type,s.supplier_name
order by lead_time desc;

/* Which high-defect suppliers are handling our fast selling products */
select 
i.product_type,
sum(i.order_quantities::int) as total_order_qty,
s.supplier_name,
sum(s.defect_rates) as defect_rates
from inventory_data i
join supplier_data s
on
i.sku = s.sku
where i.order_quantities::int > (select avg(order_quantities::INT) from inventory_data )
group by i.product_type,s.supplier_name
order by total_order_qty desc,defect_rates desc;

/*Which transportation modes and carriers are handling our most critical inventory shortages */
with Inventory_shortage as (
select 
product_type,
sku,
sum(stock_levels::int) as total_stocks,
sum(order_quantities::int) as total_qty
from inventory_data
where stock_levels::int < order_quantities::int 
group by product_type,sku
),
carriers as (
select 
l.shipping_carriers,
l.transportation_modes,
i.total_stocks,
i.total_qty
from logistics_data l
join Inventory_shortage i 
on 
l.sku=i.sku)
select * from carriers 
order by total_stocks asc;

/*End to End */ 
select
i.product_type,
i.stock_levels::int,
i.order_quantities::int,
l.shipping_carriers,
l.shipping_times,
l.transportation_modes,
s.supplier_name,
s.manufacturing_leadtime,
s.defect_rates
from inventory_data i
join logistics_data l
on
l.sku = i.sku
join supplier_data s
on
i.sku=s.sku
order by defect_rates desc;
