SELECT SpotifyClone.usuario.name AS pessoa_usuaria,
CASE WHEN MAX(YEAR(SpotifyClone.historico.date)) >= 2021 THEN 'Ativa' ELSE 'Inativa' END AS status_pessoa_usuaria
FROM  SpotifyClone.usuario


JOIN (SELECT SpotifyClone.historico.usuario_id,MAX(SpotifyClone.historico.date) AS last_date
FROM  SpotifyClone.historico GROUP BY SpotifyClone.historico.usuario_id) 
AS ultima_data ON SpotifyClone.usuario.usuario_id = ultima_data.usuario_id


JOIN SpotifyClone.historico ON ultima_data.usuario_id = SpotifyClone.historico.usuario_id AND ultima_data.last_date = SpotifyClone.historico.date
GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria;
