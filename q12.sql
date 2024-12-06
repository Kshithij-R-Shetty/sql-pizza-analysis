#Analyze the cumulative revenue generated over time.

#ex if day1 sale is 100 revenue is 100, day 2 sale is 150 
#then cumilative revenue is day1 revenue+ day 2 revenue ie.250

select order_date, 
round(sum(revenue)over (order by order_date),2) as cum_ravenue
from
(select orders.order_date,
round(sum(orders_details.quantity*pizzas.price),2) as revenue
from orders_details join pizzas
on orders_details.pizza_id=pizzas.pizza_id
join orders
on orders.order_id=orders_details.order_id
group by orders.order_date) as sales ;

