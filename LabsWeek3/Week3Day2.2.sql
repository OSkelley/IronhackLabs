#1
select ca.name as category,
count(distinct f.film_id) as number_films
from sakila.film_category fc
left join sakila.film f
	on f.film_id = fc.film_id
left join sakila.category ca
	on fc.category_id = ca.category_id
group by 1;


#2
select s.store_id, ci.city, co.country
from sakila.store s
left join sakila.address a
	on a.address_id = s.address_id
left join sakila.city ci
	on a.city_id = ci.city_id
left join sakila.country co
	on ci.country_id = co.country_id;

#3
select s.store_id, sum(p.amount) as revenue
from sakila.customer cu
left join sakila.store s
	on s.store_id = cu.store_id
left join sakila.payment p
	on p.customer_id = cu.customer_id
group by 1;

#4
select ca.name as category,
avg(f.length) as average_length
from sakila.film_category fc
left join sakila.film f
	on f.film_id = fc.film_id
left join sakila.category ca
	on fc.category_id = ca.category_id
group by 1;

#5 
select ca.name as category,
avg(f.length) as average_length
from sakila.film_category fc
left join sakila.film f
	on f.film_id = fc.film_id
left join sakila.category ca
	on fc.category_id = ca.category_id
group by 1
order by avg(f.length) desc
limit 3;

#6
select f.title, count(r.inventory_id) as rental_number
from sakila.inventory i
left join sakila.film f
	on f.film_id = i.film_id
left join sakila.rental r
	on r.inventory_id = i.inventory_id
group by 1
order by count(r.inventory_id) desc
limit 10;

#7
select i.store_id, f.title, count(1) as number_of_units
from sakila.inventory i
left join sakila.film f
	on f.film_id = i.film_id
where f.title like "%academy dinosaur%"
group by i.store_id, f.title;

select i.store_id, f.title, count(1) as number_of_units
from sakila.inventory i
inner join (select film_id, title from sakila.film where title like "%academy dinosaur%") f
	on f.film_id = i.film_id
group by i.store_id, f.title;

#8
select distinct f.title,
case when i.inventory_id is null then "Not Available"
	 else "Available"
     end as Availability
from sakila.film f
left join sakila.inventory i
	on f.film_id = i.film_id;