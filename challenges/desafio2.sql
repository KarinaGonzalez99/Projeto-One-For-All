SELECT COUNT(DISTINCT (SpotifyClone.musicas.musicas_id)) AS cancoes,
COUNT(DISTINCT (SpotifyClone.albuns.album_id)) AS albuns,
COUNT(DISTINCT (SpotifyClone.artista.artista_id)) AS artistas
FROM SpotifyClone.musicas JOIN SpotifyClone.albuns JOIN SpotifyClone.artista ;
