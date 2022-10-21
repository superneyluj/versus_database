/* Quelques requêtes de notre base de données*/

/* Tous les films réalisés par Nolan */

SELECT name, duration, synopsis, category
FROM movie
WHERE realisator_first_name = 'nolan';


/* Tous les films de sciences-fiction qui durent 2h30 ou moins */

SELECT *
FROM movie
WHERE category = 'sci-fi' AND duration <= '2:30:00';


/* Tous les acteurs de Inception */


SELECT actor.name, actor.first_name
FROM ((actor
INNER JOIN play_in_movie ON actor.id = play_in_movie.id_actor)
INNER JOIN movie ON play_in_movie.id_movie = movie.id)
WHERE movie.name = 'les affranchis';


/* Nombre de fois ou une série à été vue sur une tablette */

SELECT COUNT(id) AS 'Nb de vu sur tablette'
FROM tv_show_viewing
WHERE device = 'tablette';


/* Liste des films ou Matt Damon a joué (à modif les entrée pour avoir une sortie) */

SELECT movie.name
FROM movie, actor, play_in_movie
WHERE actor.name = 'leonardo' AND actor.first_name = 'di caprio' AND movie.id = play_in_movie.id_movie AND play_in_movie.id_actor = actor.id;


/* Nombre d'utilisateur par platform */

SELECT platform.name, COUNT(utilisateur.id)
FROM utilisateur, platform, subscription
WHERE utilisateur.id = subscription.id_user AND subscription.id_platform = platform.id
GROUP BY platform.name
ORDER BY COUNT(utilisateur.id) DESC;


/* Les films les plus regardés peu importe la platforme et trier par platform */

SELECT movie.name, COUNT(movie_viewing.id_movie)
FROM movie, movie_viewing
WHERE movie_viewing.id_movie = movie.id
GROUP BY movie.name
ORDER BY COUNT(movie_viewing.id) DESC;


/* Renvoie uniquement les noms et prénoms de la table acteur */
SELECT name, first_name FROM actor;


/* Renvoie tous les abonnés masculins */
SELECT * FROM utilisateur
WHERE gender = 'M';


/* Renvoie les de science fiction réalisé par nolan */
SELECT * FROM movie
WHERE category = 'sci-fi' AND realisator_first_name = 'nolan';


/* Renvoie les films de science fiction et les films d'horreur */
SELECT * FROM movie
WHERE category = 'sci-fi' OR category = 'horreur';


/* Renvoie le nombre de films */
SELECT COUNT(*) FROM movie;


/* Renvoie le prix moyen des abonnement */
SELECT AVG(price)
FROM platform;


/* Renvoie l'âge des utilisateur depuis leurs dates de naissance */
SELECT *, YEAR(CURDATE()) - YEAR(date_of_birth) AS age FROM utilisateur;


/* Renvoie les dates de souscription de l'utilisateur Antoine Jorand */
SELECT subscription.subscription_date
FROM (subscription
INNER JOIN utilisateur ON subscription.id_user = utilisateur.id)
WHERE user_name = 'jorand';


/* Renvoie les noms des gens abonnés à la platforme netflix */
SELECT user_name FROM utilisateur
WHERE id IN
(
	SELECT id_user
	FROM subscription
	WHERE id_platform in
	 	(
	 	 SELECT id 
	 	 FROM platform 
	 	 WHERE name = 'netflix'
		)
);

/* Autre moyen avec un inner join */
SELECT utilisateur.user_name, utilisateur.user_first_name
FROM((utilisateur 
INNER JOIN subscription ON utilisateur.id = subscription.id_user) 
INNER JOIN platform ON subscription.id_platform=platform.id)
WHERE platform.name = 'netflix';


/* Renvoie les acteurs qui jouent dans les affranchis */
SELECT name, first_name FROM actor
WHERE id IN
(
	SELECT id_actor
	FROM play_in_movie
	WHERE id_movie IN
	(
		SELECT id FROM movie WHERE name = 'les affranchis'
		)
);


/* Renvoie les films dans lequels joue joe pesci */
SELECT name FROM movie
WHERE id IN
(
	SELECT id_movie
	FROM play_in_movie
	WHERE id_actor IN
	(
		SELECT id FROM actor WHERE name = 'joe' AND first_name = 'pesci'
		)
);


/* Renvoie la plateforme la moins chère */
SELECT * FROM platform
WHERE price = (SELECT MIN(price) FROM platform);


/* Renvoie les plateformes dont le prix est compris entre 10€ et 20€ */
SELECT * FROM platform
WHERE price BETWEEN 10 AND 20;


/* Changement des alias de la table utilisateur */
SELECT user_name AS 'nom',
user_first_name AS 'prénom',
gender AS 'genre',
email_addr AS 'adresse email',
user_login AS 'login',
user_password AS 'password',
country AS 'pays'
FROM utilisateur;


/* Renvoie les utilisateurs avec une adresse en @polytech.com */
 SELECT * FROM utilisateur
 WHERE email_addr LIKE "%@polytech.com";



/* Renvoie la moyenne des notes de chaque films */
SELECT avg(movie_viewing.rate),movie.name
FROM movie_viewing,movie
WHERE movie_viewing.id_movie=movie.id
GROUP BY movie.id;


/* Renvoie l'âge moyen des utilisateurs */
SELECT AVG(YEAR(CURDATE()) - YEAR(date_of_birth)) AS 'âge moyen'
FROM utilisateur;
