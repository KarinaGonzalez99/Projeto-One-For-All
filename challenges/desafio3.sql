WITH ouvidas AS (
SELECT SpotifyClone.historico.usuario_id, COUNT(*) AS musicas_ouvidas, SUM(SpotifyClone.musicas.duracao) AS duracao_total
FROM SpotifyClone.historico
JOIN SpotifyClone.musicas ON SpotifyClone.historico.musicas_id = SpotifyClone.musicas.musicas_id
GROUP BY SpotifyClone.historico.usuario_id)

SELECT 
SpotifyClone.usuario.name AS pessoa_usuaria, ouvidas.musicas_ouvidas, ROUND(ouvidas.duracao_total / 60, 2) AS total_minutos
FROM SpotifyClone.usuario
JOIN ouvidas ON SpotifyClone.usuario.usuario_id = ouvidas.usuario_id
ORDER BY pessoa_usuaria;
