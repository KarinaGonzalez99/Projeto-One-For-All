DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.assinatura(
    assinatura_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL, value DECIMAL(10) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artista(
    artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.usuario(
    usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL, idade INT,  assinatura_id INT, asssinatura DATE NOT NULL,
    FOREIGN KEY (assinatura_id) REFERENCES SpotifyClone.assinatura(assinatura_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.albuns(
    album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,  lancamentk YEAR(4) NOT NULL, artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.musicas(
    musicas_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    duracao INT NOT NULL, album_id INT,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.follower(
    usuario_id INT,  artista_id INT,
    PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.historico(
    date DATETIME NOT NULL, usuario_id INT, musicas_id INT,
    PRIMARY KEY(date, usuario_id, musicas_id), FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id), FOREIGN KEY (musicas_id) REFERENCES musicas(musicas_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.assinatura (name, value)
VALUES ('gratuito', 0), ('universitário', 5.99), ('pessoal', 6.99), ('familiar', 7.99);

INSERT INTO SpotifyClone.artista (name)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone'); 

INSERT INTO SpotifyClone.usuario (name, idade, assinatura_id, asssinatura) 
VALUES ('Barbara Liskov', '82', '1', '2019-10-20'), ('Robert Cecil Martin', '58', '1', '2017-01-06'), ('Ada Lovelace', '37', '2', '2017-12-30'), ('Martin Fowler', '46', '2', '2017-01-17'),
('Sandi Metz', '58', '2', '2018-04-29'), ('Paulo Freire', '19', '3', '2018-02-14'), ('Bell Hooks', '26', '3', '2018-01-05'), ('Christopher Alexander', '85', '4', '2019-06-05'),
('Judith Butler', '45', '4', '2020-05-13'), ('Jorge Amado', '58', '4', '2017-02-17');

INSERT INTO SpotifyClone.albuns (name, artista_id, lancamentk)
VALUES ('Renaissance', 1, '2022'), ('Jazz', 2, '1978'), ('Hot Space', 2, '1982'), ('Falso Brilhante', 3, '1998'), 
('Vento de Maio', 3, '2001'), ('QVVJFA?', 4, '2003'), ('Somewhere Far Beyond', 5, '2007'), ('I Put A Spell On You', 6, '2012');

INSERT INTO SpotifyClone.musicas (name, duracao, album_id)
VALUES ("BREAK MY SOUL", 279, 1), ("VIRGO'S GROOVE", 369, 1), ("ALIEN SUPERSTAR", 116, 1), ("Don't Stop Me Now", 203, 2), ("Under Pressure", 152, 3), 
("Como Nossos Pais", 105, 4), ("O Medo de Amar é o Medo de Ser Livre", 207, 5), ("Samba em Paris", 267, 6),
 ("The Bard's Song", 244, 7), ("Feeling Good", 100, 8);


INSERT INTO SpotifyClone.follower (usuario_id, artista_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);

INSERT INTO SpotifyClone.historico (date, usuario_id, musicas_id)
VALUES ("2022-02-28 10:45:55", 1, 8), ("2020-05-02 05:30:35", 1, 2), ("2020-03-06 11:22:33", 1, 10), ("2022-08-05 08:05:17", 2, 10),
("2020-01-02 07:40:33", 2, 7), ("2020-11-13 16:55:13", 3, 10), ("2020-12-05 18:38:30", 3, 2), ("2021-08-15 17:10:10", 4, 8),
("2022-01-09 01:44:33", 5, 8), ("2020-08-06 15:23:43", 5, 5), ("2017-01-24 00:31:17", 6, 7), ("2017-10-12 12:35:20", 6, 1),
("2011-12-15 22:30:49", 7, 4), ("2012-03-17 14:56:41", 8, 4), ("2022-02-24 21:14:22", 9, 9), ("2015-12-13 08:30:22", 10, 3);
