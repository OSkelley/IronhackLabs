# CHALLENGE 1

# 1.1
select min(length) as min_duration,
max(length) as max_duration
from sakila.film;

#1.2
select floor(avg(length)/60) as avg_hours,
round(avg(length)%60) as minutes
from sakila.film;

#2.1
select datediff(max(rental_date), 
min(rental_date)) as days_operating 
from sakila.rental;

#2.2
select *, 
month(rental_date) as month_rental, 
weekday(rental_date) as day_rental
from sakila.rental;

#2.3
select *, 
case when weekday(rental_date) > 4 then "Weekend"
	 when weekday(rental_date) < 5 then "Weekday"
     end as day_type
from sakila.rental;

#3
select coalesce(rental_duration, "Not Available") as rental, title
from sakila.film
order by title asc;

#4
select concat(first_name, " ", last_name) as full_name, 
left(email, 3)
from sakila.customer
order by last_name asc;

# CHALLENGE 2 ---------------------------------------------------------------------

# 1.1
select count(1) 
from sakila.film;

#1.2
select rating, count(1)
from sakila.film
group by 1;

#1.3
select rating, count(1)
from sakila.film
group by 1
order by count(1) desc;

#2
select staff_id, 
count(1) as number_rentals
from sakila.rental
group by (1);

#3.1
select rating, 
count(1) as number_films, 
round(avg(length),2) as average_length
from sakila.film
group by 1
order by round(avg(length),2) desc;

#3.2
select rating, 
count(1) as number_films, 
round(avg(length),2) as average_length
from sakila.film
group by 1
having round(avg(length),2) > 120
order by round(avg(length),2) desc;

#4
select last_name, 
count(1) as name_frequency
from sakila.actor
group by 1
having count(1) < 2;