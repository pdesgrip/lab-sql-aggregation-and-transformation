-- Challenge 1


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

-- Concatenates first and last names and returns first 3 letters of email address

SELECT CONCAT(first_name, ' ', last_name) AS "Customer Name", LEFT(email, 3) AS "Email Prefix"
FROM sakila.customer
ORDER BY last_name ASC;

-- Challenge 2

-- Total Number of films released grouped by rating

SELECT COUNT(*) AS "Total Number of Films"
FROM sakila.film;

-- Number of films by rating

SELECT rating, COUNT(*) AS "Number of Films"
FROM sakila.film
GROUP BY rating;


-- Number of films for each rating sorted

SELECT rating, COUNT(*) AS "Number of Films"
FROM sakila.film
GROUP BY rating
ORDER BY COUNT(*) DESC;

-- Rentals by staff

SELECT staff_id, COUNT(*) AS "Number of Rentals Processed"
FROM sakila.rental
GROUP BY staff_id
ORDER BY COUNT(*) DESC;

-- Mean film duration

SELECT rating, ROUND(AVG(length), 2) AS "Mean Film Duration"
FROM sakila.film GROUP BY rating
ORDER BY "Mean Film Duration" DESC;

-- Ratings with mean above 2 hours

SELECT rating, ROUND(AVG(length), 2) AS "Mean Film Duration"
FROM sakila.film
GROUP BY rating
HAVING AVG(length) > 120;


-- Last names not repeated in Actor table

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;





