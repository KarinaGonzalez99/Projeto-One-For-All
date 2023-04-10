WITH elis_albuns AS (
SELECT SpotifyClone.artista.name AS artista, SpotifyClone.albuns.name AS album
FROM SpotifyClone.albuns
JOIN SpotifyClone.artista ON SpotifyClone.albuns.artista_id = SpotifyClone.artista.artista_id 
WHERE 
SpotifyClone.artista.name = "Elis Regina")


SELECT * FROM elis_albuns;
