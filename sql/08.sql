/*
 * The film 'BUCKET BROTHERHOOD' is your favorite movie, but you're tired of watching it.
 * You want to find something new to watch that is still similar to 'BUCKET BROTHERHOOD'.
 * To find a similar movie, you decide to search the history of movies that other people have rented.
 * Your idea is that if a lot of people have rented both 'BUCKET BROTHERHOOD' and movie X,
 * then movie X must be similar and something you'd like to watch too.
 * Your goal is to create a SQL query that finds movie X.
 * Specifically, write a SQL query that returns all films that have been rented by at least 3 customers who have also rented 'BUCKET BROTHERHOOD'.
 *
 * HINT:
 * This query is very similar to the query from problem 06,
 * but you will have to use joins to connect the rental table to the film table.
 *
 * HINT:
 * If your query is *almost* getting the same results as mine, but off by 1-2 entries, ensure that:
 * 1. You are not including 'BUCKET BROTHERHOOD' in the output.
 * 2. Some customers have rented movies multiple times.
 *    Ensure that you are not counting a customer that has rented a movie twice as 2 separate customers renting the movie.
 *    I did this by using the SELECT DISTINCT clause.
 */

SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental ON rental.inventory_id = i.inventory_id
JOIN customer ON customer.customer_id = rental.customer_id
JOIN inventory i2 ON i2.film_id = f.film_id
JOIN rental r2 ON r2.inventory_id = i2.inventory_id
WHERE r2.return_date IS NOT NULL
AND f.title != 'BUCKET BROTHERHOOD'
AND customer.customer_id IN (
  SELECT rental.customer_id
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  JOIN film ON inventory.film_id = film.film_id
  WHERE film.title = 'BUCKET BROTHERHOOD'
)
GROUP BY f.film_id, f.title
HAVING COUNT(DISTINCT rental.customer_id) >= 3
ORDER BY f.title;




