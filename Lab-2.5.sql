/*Lab | SQL Queries - Lesson 2.5 (dataV3_lesson_2.5_lab) */

use sakila;
-- 1.Select all the actors with the first name ‘Scarlett’.

 select first_name from actor
where first_name = "Scarlett";
 
 -- 2.How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(*) FROM rental;
SELECT COUNT(*) FROM film;

 -- 3.What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select min(length) as min_duration,max(length) as max_duration from film;


-- 4.What's the average movie duration expressed in format (hours, minutes)?
-- SELECT avg(length) as avg_movie_duration from sakila.film; 
SELECT SEC_TO_TIME(AVG(length)*60) as 'hours and min'
FROM film;
      
-- 5.How many distinct (different) actors' last names are there?

select count(distinct last_name) from actor;


-- 6.Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) as 'days_operating'
FROM sakila.rental;


-- 8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

-- SELECT * ,DAYNAME(return_date) as day_type from rental;
SELECT DATE_FORMAT(rental_date,'%M') AS 'month', DATE_FORMAT(rental_date,'%a') AS 'day'
FROM rental
LIMIT 20;

select rental_date,
CASE
WHEN DATE_FORMAT(rental_date,'%a') = 'Sat' then 'weekend'
WHEN DATE_FORMAT(rental_date,'%a') = 'Sun' then 'weekend'
ELSE 'weekday'
END AS column_day_type
FROM rental;

-- 9.Get release years.

SELECT title, release_year as 'release years' FROM sakila.film;



-- 10.Get all films with ARMAGEDDON in the title.

select * from film where title like '%ARMAGEDDON%';


-- 11.Get all films which title ends with APOLLO.
select film_id,title from film where title like '%APOLLO';

-- 12.Get 10 the longest films.
SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13.How many films include Behind the Scenes content?

 select count(special_features) as 'Behind_the_Scenes_content' from film where special_features like '%Behind the scenes%';
 