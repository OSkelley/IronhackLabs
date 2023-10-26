#1
select count(1) as number_of_copies
from sakila.inventory
where film_id in (select film_id from sakila.film where title like '%Hunchback Impossible%');

#2
select title, length
from sakila.film
where length > (select avg(length) from sakila.film);

#3
select concat(first_name, " ", last_name) as actors_in_alone_trip
from sakila.actor
where actor_id in (
	select actor_id from sakila.film_actor where film_id in (
		select film_id from sakila.film where title like "Alone Trip"
        )
	);
        
#4
select title
from sakila.film
where film_id in (
	select film_id from sakila.film_category where category_id in (
		select category_id from sakila.category where name like "Family"
        )
	);
    
#5
select concat(first_name, " ", last_name) as name, email
from sakila.customer
where address_id in (
	select address_id from sakila.address where city_id in (
		select city_id from sakila.city where country_id in (
			select country_id from sakila.country where country like "Canada"
            )
		)
	);

#6
select title
from sakila.film
where film_id in (
	select film_id from film_actor where actor_id = (
		select actor_id from (
			select actor_id, count(1)
			from sakila.film_actor
			group by 1
			order by count(1) desc
			limit 1
            ) top_actor
        )
	);

#7
select title
from sakila.film
where film_id in (
	select film_id from sakila.inventory where inventory_id in (
		select inventory_id from sakila.rental where rental_id in (
			select rental_id from sakila.payment where customer_id = (
				select customer_id from (
					select customer_id, sum(amount)
                    from sakila.payment
                    group by (1)
                    order by sum(amount) desc
                    limit 1
                    ) big_profit
				)
			)
		)
	);
    
#8
select customer_id as client_id, sum(amount) as total_amout_spent
from sakila.payment 
where sum(amount) > (
	select avg(average_sum)
    from (
		select sum(amount) as average_sum
        ) x
	);
