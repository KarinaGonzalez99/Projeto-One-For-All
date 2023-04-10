WITH seguidores_por_artista AS ( 
SELECT artista_id, COUNT(*) AS total_seguidores 
FROM SpotifyClone.follower 
GROUP BY artista_id)

SELECT artista.name AS artista, albuns.name AS album, seguidores_por_artista.total_seguidores AS pessoas_seguidoras
FROM SpotifyClone.albuns JOIN SpotifyClone.artista ON albuns.artista_id = artista.artista_id JOIN seguidores_por_artista ON artista.artista_id = seguidores_por_artista.artista_id

ORDER BY pessoas_seguidoras DESC, artista.name,  albuns.name
