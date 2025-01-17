-- Insert into PlanoAssinatura
INSERT INTO PlanoAssinatura (assinaturaID, assinatura) VALUES
(0, 'Free'),
(1, 'Premium'),
(2, 'Family');

-- Insert into Contacto
INSERT INTO Contacto (contactoID, contacto) VALUES
(1, '123456789'),
(2, '987654321'),
(3, '555555555');

-- Insert into NomeUtilizador
INSERT INTO NomeUtilizador (nomeUtilizadorID, nomeUtilizador) VALUES
(1, 'john_doe'),
(2, 'jane_smith'),
(3, 'creator_01');

-- Insert into Pessoa
INSERT INTO Pessoa (userID, nome, localizacao, fotoPerfil) VALUES
(1, 'John Doe', 'New York, USA', NULL),
(2, 'Jane Smith', 'London, UK', NULL),
(3, 'Creator 01', 'Berlin, Germany', NULL),
(4, 'Artist One', 'Los Angeles, USA', NULL),
(5, 'Artist Two', 'Paris, France', NULL);

-- Insert into Artista
INSERT INTO Artista (artistaID, biografia, proximosEventos) VALUES
(4, 'A famous pop artist from LA.', 'Live concert in NYC'),
(5, 'A classical music artist based in Paris.', 'Touring Europe in 2025');

-- Insert into Utilizador
INSERT INTO Utilizador (userID, nomeUtilizador, palavrapasse, contacto, dataNascimento, assinaturaID) VALUES
(1, 1, 'password123', 1, '1990-05-12', 1),
(2, 2, 'securepass456', 2, '1985-08-22', 2),
(3, 3, 'mypassword789', 3, '2000-11-30', 0);

-- Insert into Criador
INSERT INTO Criador (criadorID, biografia) VALUES
(3, 'A passionate podcast creator and content maker.');

-- Insert into Playlist
INSERT INTO Playlist (playlistID, nome) VALUES
(1, 'Top 40 Hits'),
(2, 'Relaxing Jazz');

-- Insert into Album
INSERT INTO Album (albumID, nome, dataLancamento, fotoCapa) VALUES
(1, 'Pop Classics', '2015-04-10', NULL),
(2, 'Best of Jazz', '2018-09-22', NULL);

-- Insert into Musica
INSERT INTO Musica (musicaID, album, nome, duracaoSeg, fotoCapa) VALUES
(1, 1, 'Pop Song 1', 180, NULL),
(2, 1, 'Pop Song 2', 210, NULL),
(3, 2, 'Jazz Tune 1', 150, NULL),
(4, 2, 'Jazz Tune 2', 220, NULL);

-- Insert into Podcast
INSERT INTO Podcast (podcastID, nome, fotoCapa) VALUES
(1, 'Tech Talks', NULL),
(2, 'True Crime Stories', NULL);

-- Insert into Episodio
INSERT INTO Episodio (episodioID, podcast, nome, descricao, dataLancamento, duracaoSeg) VALUES
(1, 1, 'The Future of AI', 'Discussing the future of artificial intelligence.', '2024-12-01', 1200),
(2, 2, 'The Case of Jane Doe', 'Exploring the mysterious case of Jane Doe.', '2024-11-28', 900);

-- Insert into Genero
INSERT INTO Genero (generoID, genero) VALUES
(1, 'Pop'),
(2, 'Jazz'),
(3, 'Technology'),
(4, 'True Crime');

-- Insert into Tema
INSERT INTO Tema (temaID, tema) VALUES
(1, 'AI'),
(2, 'Mystery');

-- Insert into OuviuMusica
INSERT INTO OuviuMusica (musicaID, userID, dataHora) VALUES
(1, 1, '2024-12-01 10:00:00'),
(3, 2, '2024-12-01 11:00:00');

-- Insert into OuviuEpisodio
INSERT INTO OuviuEpisodio (episodioID, userID, dataHora, duracaoSeg, progressoEpisodio) VALUES
(1, 1, '2024-12-01 10:30:00', 1200, 600),
(2, 2, '2024-11-30 09:00:00', 900, 900);

-- Insert into SeguiuUtilizador
INSERT INTO SeguiuUtilizador (seguidor, seguido) VALUES
(1, 2),
(2, 1);

-- Insert into SeguiuArtista
INSERT INTO SeguiuArtista (userID, artistaID) VALUES
(1, 4),
(2, 5);

-- Insert into SeguiuCriador
INSERT INTO SeguiuCriador (userID, criadorID) VALUES
(1, 3),
(2, 3);

-- Insert into GostouAlbum
INSERT INTO GostouAlbum (userID, albumID) VALUES
(1, 1),
(2, 2);

-- Insert into GostouEpisodio
INSERT INTO GostouEpisodio (userID, episodioID) VALUES
(1, 1),
(2, 2);

-- Insert into GostouMusica
INSERT INTO GostouMusica (userID, musicaID) VALUES
(1, 1),
(2, 3);

-- Insert into Colaborador
INSERT INTO Colaborador (userID, playlistID) VALUES
(1, 1),
(2, 2);

-- Insert into GuardouPlaylist
INSERT INTO GuardouPlaylist (userID, playlistID) VALUES
(1, 1),
(2, 2);

-- Insert into ArtistaMusica
INSERT INTO ArtistaMusica (artistaID, musicaID) VALUES
(4, 1),
(5, 3);

-- Insert into MusicaPlaylist
INSERT INTO MusicaPlaylist (musicaID, playlistID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- Insert into MusicaGenero
INSERT INTO MusicaGenero (musicaID, generoID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2);

-- Insert into PodcastGenero
INSERT INTO PodcastGenero (podcastID, generoID) VALUES
(1, 3),
(2, 4);

-- Insert into PodcastEpisodio
INSERT INTO PodcastEpisodio (podcastID, episodioID) VALUES
(1, 1),
(2, 2);

-- Insert into CriadorPodcast
INSERT INTO CriadorPodcast (criadorID, podcastID) VALUES
(3, 1),
(3, 2);

-- Insert into EpisodioTema
INSERT INTO EpisodioTema (episodioID, temaID) VALUES
(1, 1),
(2, 2);
