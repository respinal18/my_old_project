--SQL MURDER MYSTERY!--

--An actor has murdered famous director Martin Scungilli in Hollywood!  
--The clues to finding the killer are hidden in a database.  
--Answer the questions using SQL (and the dvdrental database) to get the next clue.  
--Good Luck! 


-- How many customers do we have?
SELECT COUNT (customer_id) AS number_of_customers
FROM customer
-- we have 599 customers!

--=======================================================
--That's too many customers to interview.  
--The customer who rented 12 movies saw a clue in a movie that they rented.   
--What is the customer_id for the only customer who rented 12 movies?

SELECT COUNT (customer_id) AS customer_rentals, customer_id
FROM rental
GROUP BY customer_id
-- The customer id is 318!

--OR--Another solution
SELECT COUNT (rental_id), customer_id
FROM rental
GROUP BY customer_id
HAVING count (rental_id) = 12;
--======================================================
--The customer name will help us figure out the film that contains the clue.
--What's the last name of the customer who rented 12 movies? 

SELECT *
FROM customer
WHERE customer_id = 318
-- Last name is Wyman!

--======================================================
--The customer can't remember the name of the film, but knows that they rented the 
--movie that contains the clue on July 6, after noon but before midnight.  
--We need to check the inventory records to find the movie.  
--What is the inventory_id for the film this person rented between 
--2005-07-06 12:00:00.000 and 2005-07-06 23:59:59.000?

--BETWEEN july 6th and 12pm-12am
SELECT inventory_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-07-06 12:00:00.000' 
AND '2005-07-06 23:59:59.000' 
AND customer_id = 318;
-- the inventory_id is 4,282


--======================================================

--The inventory table can tell us the film_id for the movie with the clue.  
--Since we know the inventory_id we should be able to get the film_id.  
--What's the film_id of the film with this inventory_id?

SELECT *
FROM inventory i 
WHERE inventory_id = 4282;
-- the film_id is 932

--======================================================

--If we know the film_id, we can get the name of the film that contains the clue. 
--What's the name of that film?

SELECT film_id, title
FROM film f 
WHERE film_id = 932;
-- the name of the film is "Valley Packer"

--======================================================


--The actor who killed Martin Scungilli was in that film!  The customer saw the actor 
--planning the murder in the DVD out-takes.  We need to find out which actors were in 
--that film, and then we can figure out which of them murdered Martin.  
--The film_actor table can tell us which actors appeared in that film.  
--The actor who killed Martin Scungilli  has been in 19 films.  
--What is the actor's actor_id?  

SELECT *
FROM film_actor fa
WHERE film_id = 932;
-- actor ids in the film: 42, 63, 83, 101
-- now we need to know what actor id has been in 19 films
-- we need the table: 
SELECT COUNT(actor_id) AS number_of_films, actor_id 
FROM film_actor fa 
GROUP BY actor_id
-- the actor's id is 63! :O
--OR DO THIS:
SELECT actor_id, count (film_id)
FROM film_actor
GROUP BY actor_id
HAVING count(film_id) = 19;

--======================================================

--I think we're getting close.  Now that we know the actor_id, 
--we can find the actor's name!  
--What is the actor's name?  
-- now we need the actor table to tell us their name by their actor id!

SELECT *
FROM actor a 
WHERE actor_id = 63;
-- THE ACTOR'S NAME IS CAMERON WRAY!
-- HE IS THE MURDERER!
















