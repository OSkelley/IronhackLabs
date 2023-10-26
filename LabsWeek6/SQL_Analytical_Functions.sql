-- Q1
select customer_id
, payment_date
, amount
, sum(amount) over (partition by customer_id order by payment_date) as customer_running_total
from sakila.payment
;

-- Q2
select cast(payment_date as date)
, amount
, rank() over (partition by cast(payment_date as date) order by amount desc) as basic_rnk
, dense_rank() over (partition by cast(payment_date as date) order by amount desc) as dense_rnk
from sakila.payment
;

-- Q3
select c.name as category
, f.title as film_title
, f.rental_rate as rental_rate
, rank() over (partition by c.name order by f.rental_rate desc) as rental_rnk
, dense_rank() over (partition by c.name order by f.rental_rate desc) as rental_dense_rnk
from sakila.film f
join sakila.film_category fc
	using (film_id)
join sakila.category c
	using(category_id)
;

-- Q4
select c.name as category
, f.title as film_title
, f.rental_rate as rental_rate
, rank() over (partition by c.name order by f.rental_rate desc) as rental_rnk
, dense_rank() over (partition by c.name order by f.rental_rate desc) as rental_dense_rnk
, row_number() over (partition by c.name order by f.rental_rate desc) as rental_row
from sakila.film f
join sakila.film_category fc
	using (film_id)
join sakila.category c
	using(category_id)
;

-- Q5
select payment_id
, customer_id
, amount
, payment_date
, (amount - (lag(amount) over (partition by customer_id order by payment_date))) as diff_from_prev
, (amount - (lead(amount) over (partition by customer_id order by payment_date))) as diff_from_prev
from sakila.payment;