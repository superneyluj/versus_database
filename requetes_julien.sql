/* Quelques requêtes de notre base de données*/

/*renvoie les acteur de notre base de données*/

USE versus;
SELECT * FROM actor;

/*renvoie uniquement les noms et prénoms de la table acteur*/
SELECT name, first_name FROM actor;

/*renvoie tous les abonnés masculins*/
SELECT * FROM utilisateur
WHERE gender = 'M';

/*renvoie les de science fiction réalisé par nolan*/
SELECT * FROM movie
WHERE category = 'sci-fi' AND realisator_first_name = 'nolan';

/*renvoie les films de science fiction et les films d'horreur*/
SELECT * FROM movie
WHERE category = 'sci-fi' OR category = 'horreur';

/*renvoie le nombre de films*/
SELECT COUNT(*) FROM movie;

/*renvoie la date de sub de julien*/
SELECT subscription_date
FROM subscription
WHERE id IN(SELECT id FROM utilisateur WHERE user_first_name = 'julien');


/*renvoie le prix moyen des abonnement*/
SELECT AVG(price)
FROM platform;

/*renvoie l'âge des utilisateur depuis leurs dates de naissance*/
SELECT *, YEAR(CURDATE()) - YEAR(date_of_birth) AS age FROM utilisateur;


/*renvoie les utilisateurs abonné à la platforme netflix (ne fonctionne pas à corriger)*/
SELECT UTILISATEUR.USER_NAME
FROM((utilisateur 
INNER JOIN subscription ON platform.id = subscription.id_platform) 
INNER JOIN platform ON subscription.id_platform=platform.id)
WHERE platform.name = 'netflix';


SELECT actor.name, actor.first_name
FROM ((actor
INNER JOIN play_in_movie ON actor.id = play_in_movie.id_actor)
INNER JOIN movie ON play_in_movie.id_movie = movie.id)
WHERE movie.name = 'les affranchis';

