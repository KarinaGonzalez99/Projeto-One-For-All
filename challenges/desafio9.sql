SELECT  COUNT(name) AS musicas_no_historico
FROM SpotifyClone.usuario INNER JOIN SpotifyClone.historico ON SpotifyClone.usuario.usuario_id = SpotifyClone.historico.usuario_id AND SpotifyClone.usuario.name = "Barbara Liskov"
