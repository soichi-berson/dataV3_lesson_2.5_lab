-- Lab| SQL Queries - Lesson 2.5

USE sakila;

-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';


-- 2 How many physical copies of movies are available for rent in the store's inventory? 
-- How many unique movie titles are available?
SELECT COUNT(DISTINCT inventory_id) FROM sakila.inventory; -- 4581
SELECT COUNT(DISTINCT film_id) FROM sakila.inventory;  -- 958

-- 3 What are the shortest and longest movie duration? 
-- Name the values max_duration and min_duration.
SELECT max(length) AS 'max_duration', min(length) AS 'min_duration' FROM sakila.film; 

-- 4 What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(FLOOR(AVG(length)/60), ' hours ', round(AVG(length)%60,0), ' minutes')
 AS 'average of hours' FROM sakila.film; 

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

-- 6 How many days was the company operating? 
-- Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date))+1 AS operating_days
FROM sakila.rental;  -- 267

-- 7 Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date) As 'month', WEEKDAY(rental_date) AS 'day_of_week' FROM sakila.rental
LIMIT 20;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
SELECT *,
CASE 
    WHEN WEEKDAY(rental_date) IN (1,7) THEN 'weekend'
    ELSE 'workday'
  END AS day_type
  
FROM sakila.rental;

-- 9 Get release years.
SELECT DISTINCT release_year FROM sakila.film; -- 2006

-- 10 Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11 Get all films which title ends with APOLLO.
SELECT * FROM film
WHERE title LIKE '%APOLLO';

-- 12 Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- 13 How many films include Behind the Scenes content?
SELECT COUNT(*) FROM sakila.film
WHERE special_features = 'Behind the Scenes' ;   -- 70

