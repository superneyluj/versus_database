/* Quelques requêtes de notre base de données*/

/*renvoie les acteur de notre base de données*/
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


