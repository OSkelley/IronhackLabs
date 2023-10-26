use sakila;

-- Show all tables.

show tables from sakila;

-- Retrieve all the data from the tables actor, film and customer.

select * from sakila.actor; 
select * from sakila.film;
select * from sakila.customer;

/*
-- Retrieve the following columns from their respective tables:
3.1 Titles of all films from the film table
3.2. List of languages used in films, with the column aliased as language from the language table
3.3 List of first names of all employees from the staff table
*/

select title from sakila.film;
select name as "Language" from sakila.language;
select first_name from sakila.staff;

-- Retrieve unique release years.

select distinct release_year from sakila.film;

/*
Counting records for database insights:
5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.
*/

select count(*) from sakila.store;
select count(*) from sakila.staff;
select count(*) from sakila.inventory;
select count(*) from sakila.rental;
select count(distinct last_name) from sakila.actor;

-- Retrieve the 10 longest films.

select title, length from film order by length desc limit 10;

/*
Use filtering techniques in order to:
7.1 Retrieve all actors with the first name "SCARLETT".
7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
7.3 Determine the number of films that include Behind the Scenes content
*/

select * from actor where first_name = "SCARLETT";
select * from film where title like "%ARMAGEDDON%" and length > 100;
select * from film where special_features = "Behind the Scenes";