# my_old_project
A project that I am proud of!

SQL Murder Mystery! Martin Scungilli has been murdered! Whodunnit?
I solved a SQL Murder Mystery using the dvdrental database on DBeaver.
How did I solve it? These are the steps I took to find the murderer!
- Answered each individual question provided that progressively gave me more clues to finding the culprit!
- Used aggregate functions to find the number of customers we have and the customer_id that rented 12 movies.
     - customer saw a clue in a movie and now we know who that customer is.
- Used the WHERE and BETWEEN clauses to find the film that was rented at a specific time.
- Found the film "Valley Packer" through the film_id.
- The actor who killed Martin Scungilli had been in 19 films. Used COUNT and GROUP BY to find the actor_ids in the film.
- Used COUNT to find which of those actor_ids have been in 19 films (actor_id is 63)!
- Using the actor table, I discovered that actor_id 63 is Cameron Wray.
- Cameron Wray is the murderer! *gasp*

This project helped provide practice with my SQL skills and it was very fun!
