USE sakila;

-- Show all max and min film durations

SELECT MIN(length) AS min_duration, MAX(length) AS max_duration 
FROM sakila.film;

-- The average film duration in hours and minutes

SELECT FLOOR(AVG(length) / 60) AS avg_duration_hours, ROUND(AVG(length) % 60) AS avg_duration_minutes 
FROM sakila.film;

-- Calculate time business in operation

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operational
FROM sakila.rental;

-- Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results

SELECT title AS "Film Title", IF(rental_duration IS NULL, 'Not Available', CAST(rental_duration AS CHAR)) AS "Rental Duration (days)"
FROM sakila.film
ORDER BY title ASC;


-- Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week. Hint: use a conditional expression

SELECT *, IF(DAYOFWEEK(rental_date) IN (1, 7), 'weekend', 'workday') AS DAY_TYPE;

-- Returns list of movies by title amnd duration and if duration is NULL replace it with "Not avilable"

SELECT rental_duration, IF(rental_duration IS NULL, 'Not Available', rental_duration) AS rental_duration
FROM sakila.film
ORDER BY rental_duration ASC;


