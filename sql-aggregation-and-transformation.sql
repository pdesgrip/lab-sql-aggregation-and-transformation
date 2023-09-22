USE sakila;

-- Show all max and min film durations

SELECT 
    MIN(length) AS min_duration, 
    MAX(length) AS max_duration 
FROM sakila.film;

-- The average film duration in hours and minutes

SELECT 
    FLOOR(AVG(length) / 60) AS avg_duration_hours,
    ROUND(AVG(length) % 60) AS avg_duration_minutes 
FROM sakila.film;

-- Calculate time business in operation

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operational
FROM sakila.rental;

-- Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results

SELECT *, MONTH(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday 
FROM sakila.rental
LIMIT 20;

