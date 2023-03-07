/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS "Actor Name"
FROM actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN film_actor fa2 ON fa2.film_id = f.film_id
JOIN actor a2 ON a2.actor_id = fa2.actor_id AND a2.actor_id != a.actor_id
WHERE f.film_id IN (
  SELECT f.film_id
  FROM film f
  JOIN film_actor ON f.film_id = film_actor.film_id
  JOIN actor ON film_actor.actor_id = actor.actor_id
  WHERE CONCAT(actor.first_name, ' ', actor.last_name) = 'RUSSELL BACALL'
)
AND CONCAT(a.first_name, ' ', a.last_name) != 'RUSSELL BACALL'
ORDER BY "Actor Name";





