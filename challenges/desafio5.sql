WITH reproducoes_por_musica AS (
    SELECT SpotifyClone.musicas.name AS cancao, COUNT(SpotifyClone.historico.musicas_id) AS reproducoes
    FROM SpotifyClone.historico JOIN SpotifyClone.musicas ON SpotifyClone.historico.musicas_id = SpotifyClone.musicas.musicas_id
    GROUP BY SpotifyClone.musicas.name)

SELECT cancao, reproducoes
FROM reproducoes_por_musica
ORDER BY reproducoes DESC, cancao
LIMIT 2;
