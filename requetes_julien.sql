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


/*renvoie le prix moyen des abonnement*/
SELECT AVG(price)
FROM platform;

/*renvoie l'âge des utilisateur depuis leurs dates de naissance*/
SELECT *, YEAR(CURDATE()) - YEAR(date_of_birth) AS age FROM utilisateur;


/*renvoie les dates de souscription de l'utilisateur Antoine Jorand*/
SELECT subscription.subscription_date
FROM (subscription
INNER JOIN utilisateur ON subscription.id_user = utilisateur.id)
WHERE user_name = 'jorand';


/*renvoie les noms des gens abonnés à la platforme netflix*/
SELECT user_name FROM utilisateur
WHERE id IN
(
	SELECT id_user
	FROM subscription
	WHERE id_platform in
	 	(
	 	 SELECT id FROM platform WHERE name = 'netflix'
		)
);

/*autre moyen avec un inner join*/
SELECT utilisateur.user_name, utilisateur.user_first_name
FROM((utilisateur 
INNER JOIN subscription ON utilisateur.id = subscription.id_user) 
INNER JOIN platform ON subscription.id_platform=platform.id)
WHERE platform.name = 'netflix';



/*renvoie les acteurs qui jouent dans les affranchis*/
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


/*renvoie les films dans lequels joue joe pesci*/
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


/*renvoie la plateforme la moins chère*/
SELECT * FROM platform
WHERE price = (SELECT MIN(price) FROM platform);


/*renvoie les plateformes dont le prix est compris entre 10€ et 20€*/
SELECT * FROM platform
where price BETWEEN 10 AND 20;


/*changement des alias de la table utilisateur*/
SELECT user_name AS 'nom',
user_first_name AS 'prénom',
gender AS 'genre',
email_addr AS 'adresse email',
user_login AS 'login',
user_password AS 'password',
country AS 'pays'
FROM utilisateur;


/*renvoie les utilisateurs avec une adresse en @polytech.com*/
 SELECT * FROM utilisateur
 WHERE email_addr LIKE "%@polytech.com";