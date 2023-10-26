#1
create view customer_rental_summary as (
select c.customer_id, concat(c.first_name, " ", c.last_name), c.email, count(rental_id) as rental_count
from sakila.customer c
inner join sakila.rental r
   using (customer_id)
group by 1, 2, 3
);

select * from customer_rental_summary;

#2
create temporary table customer_payment_summary as (
select customer_rental_summary.*, sum(p.amount) as total_paid
from customer_rental_summary
inner join sakila.payment p
	using (customer_id)
group by 1,2,3
);

select * from customer_payment_summary;

#3
