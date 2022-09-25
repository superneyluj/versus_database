-- Tous les films réalisés par Nolan

SELECT name, duration, synopsis, category
FROM movie
WHERE realisator_first_name = 'nolan';

-- Tous les films de sciences-fiction qui durent 2h30 ou moins

SELECT *
FROM movie
WHERE category = 'sci-fi' AND duration <= '2:30:00';

-- Tous les acteurs de Inception

SELECT actor.name, actor.first_name
FROM ((actor
INNER JOIN play_in_movie ON actor.id = play_in_movie.id_actor)
INNER JOIN movie ON play_in_movie.id_movie = movie.id)
WHERE movie.name = 'les affranchis';

-- Nombre de fois ou une série à été vue sur une tablette

SELECT COUNT(id) AS 'Nb de vu sur tablette'
FROM tv_show_viewing
WHERE device = 'tablette';

-- Liste des films ou Matt Damon a joué (à modif les entrée pour avoir une sortie)

SELECT movie.name
FROM ((movie
INNER JOIN play_in_movie ON movie.id = play_in_movie.id_movie)
INNER JOIN actor ON play_in_movie.id_actor = actor.id)
WHERE actor.name = 'matt' AND actor.first_name = 'damon';

-- Nombre d'utilisateur par platform

SELECT platform.name, COUNT(utilisateur.id)
FROM ((utilisateur
INNER JOIN subscription ON utilisateur.id = subscription.id_user)
INNER JOIN platform ON subscription.id_platform = platform.id)
GROUP BY platform.name
ORDER BY COUNT(utilisateur.id) DESC;