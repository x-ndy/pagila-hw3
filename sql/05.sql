/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT f.title
FROM film f
JOIN film_actor fa1 ON fa1.film_id = f.film_id
JOIN film_actor fa2 ON fa2.actor_id = fa1.actor_id
JOIN film fc ON fc.film_id = fa2.film_id AND fc.title = 'AMERICAN CIRCUS'
GROUP BY f.film_id
HAVING COUNT(DISTINCT fa1.actor_id) >= 2;





