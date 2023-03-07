/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(*)
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
JOIN country co ON ct.country_id = co.country_id
WHERE co.country != 'United States';


