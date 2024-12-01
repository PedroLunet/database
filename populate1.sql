PRAGMA FOREIGN_KEYS=ON;


-- DATA --

INSERT INTO PlanoAssinatura (assinaturaID, assinatura)
VALUES
    (assinatura1, "Gratis"),
    (assinatura2, "Premium");

INSERT INTO Tema (temaID, tema)
VALUES
    (tema1, 'Comédia'),
    (tema2, 'Tecnologia'),
    (tema3, 'Desporto'),
    (tema4, 'Música'),
    (tema5, 'Notícias');

INSERT INTO Genero (generoID, genero)
VALUES
    (genero1, 'Rock'),
    (genero2, 'Pop'),
    (genero3, 'Hip-Hop'),
    (genero4, 'Rap'),
    (genero5, 'Jazz');

-- DATA --

INSERT INTO Pessoa (userID, nome, localizacao, fotoPerfil) 
VALUES 
    (pessoa1, 'João Silva', 'Porto', NULL),
    (pessoa2, 'Maria Santos', 'Lisboa', NULL),
    (pessoa3, 'Rui Pereira', 'Braga', NULL),
    (pessoa4, 'Ana Costa', 'Faro', NULL),
    (pessoa5, 'Miguel Alves', 'Coimbra', NULL),
    (pessoa6, 'Sara Santos', 'Porto', NULL),
    (pessoa7, 'Ricardo Pereira', 'Lisboa', NULL),
    (pessoa8, 'Inês Costa', 'Braga', NULL),
    (pessoa9, 'Pedro Alves', 'Faro', NULL),
    (pessoa10, 'Carla Santos', 'Coimbra', NULL),
    (pessoa11, 'Joana Silva', 'Porto', NULL),
    (pessoa12, 'Mário Santos', 'Lisboa', NULL),
    (pessoa13, 'Rita Pereira', 'Braga', NULL),
    (pessoa14, 'André Costa', 'Faro', NULL),
    (pessoa15, 'Marta Alves', 'Coimbra', NULL),
    (pessoa16, 'Tiago Santos', 'Porto', NULL),
    (pessoa17, 'Catarina Pereira', 'Lisboa', NULL),
    (pessoa18, 'Vasco Costa', 'Braga', NULL),
    (pessoa19, 'Sofia Alves', 'Faro', NULL),
    (pessoa20, 'Hugo Santos', 'Coimbra', NULL);
    
INSERT INTO Artista (artistaID, biografia, proximosEventos)
VALUES
    (artista1, 'Biografia do artista 1', 'Próximos eventos do artista 1'),
    (artista2, 'Biografia do artista 2', 'Próximos eventos do artista 2'),
    (artista3, 'Biografia do artista 3', 'Próximos eventos do artista 3'),
    (artista4, 'Biografia do artista 4', 'Próximos eventos do artista 4'),
    (artista5, 'Biografia do artista 5', 'Próximos eventos do artista 5');

INSERT INTO Utilizador (userID, nomeUtilizador, palavrapasse, contacto, dataNascimento, assinaturaID)
VALUES
    (utilizador1, 'joaosilva', '8hjgJhj67fj', '912345678','1990-01-01', 1),
    (utilizador2, 'mariasantos', '8hjgJhj67fj', '912345678','1990-01-01', 1);








INSERT INTO Criador (criadorID, biografia)
VALUES
    (criador1, 'Biografia do criador 1'),
    (criador2, 'Biografia do criador 2'),
    (criador3, 'Biografia do criador 3'),
    (criador4, 'Biografia do criador 4'),
    (criador5, 'Biografia do criador 5');

INSERT INTO Playlist (playlistID, nome)
VALUES
    (playlist1, 'Playlist 1'),
    (playlist2, 'Playlist 2'),
    (playlist3, 'Playlist 3'),
    (playlist4, 'Playlist 4'),
    (playlist5, 'Playlist 5'),
    (playlist6, 'Playlist 6'),
    (playlist7, 'Playlist 7'),
    (playlist8, 'Playlist 8'),
    (playlist9, 'Playlist 9'),
    (playlist10, 'Playlist 10');

INSERT INTO Musica (musicaID, album, nome, duracaoSeg, fotoCapa)
VALUES
    (musica1, album1, 'Musica 1', 243, NULL), 
    (musica2, album1, 'Musica 2', 185, NULL), 
    (musica3, album1, 'Musica 3', 210, NULL),  
    (musica4, album1, 'Musica 4', 180, NULL),
    (musica5, album1, 'Musica 5', 200, NULL), 
    (musica6, album1, 'Musica 6', 243, NULL),
    (musica7, album1, 'Musica 7', 185, NULL),
    (musica8, album1, 'Musica 8', 207, NULL),
    (musica9, album1, 'Musica 9', 180, NULL),
    (musica10, album2, 'Musica 10', 200, NULL),
    (musica11, album2, 'Musica 11', 243, NULL),
    (musica12, album2, 'Musica 12', 185, NULL),
    (musica13, album2, 'Musica 13', 210, NULL),
    (musica14, album3, 'Musica 14', 180, NULL),
    (musica15, album3, 'Musica 15', 237, NULL),
    (musica16, album3, 'Musica 16', 243, NULL),
    (musica17, album3, 'Musica 17', 185, NULL),
    (musica18, album3, 'Musica 18', 210, NULL),
    (musica19, album4, 'Musica 19', 378, NULL),
    (musica20, album4, 'Musica 20', 200, NULL),
    (musica21, album4, 'Musica 21', 243, NULL),
    (musica22, album4, 'Musica 22', 185, NULL),
    (musica23, album4, 'Musica 23', 210, NULL),
    (musica24, album4, 'Musica 24', 180, NULL),
    (musica25, album5, 'Musica 25', 200, NULL);

INSERT INTO Album (albumID, nome, dataLancamento, fotoCapa)
VALUES
    (album1, 'Album 1', '2020-01-01', NULL),
    (album2, 'Belém', '2005-08-17', NULL),
    (album3, 'Lunet', '2004-06-14', NULL),
    (album4, 'Vieira', '2004-09-29', NULL),
    (album5, 'Album 5', '2023-04-09', NULL);

INSERT INTO Podcast (podcastID, nome, fotoCapa)
VALUES
    (podcast1, 'Podcast 1', NULL),
    (podcast2, 'Podcast 2', NULL),
    (podcast3, 'Podcast 3', NULL),
    (podcast4, 'Podcast 4', NULL);

INSERT INTO Episodio (episodioID, podcast, nome, descricao, dataLancamento, duracaoSeg)
VALUES
    (ep1pod1, podcast1, 'Episodio 1', 'Especial de Ano Novo!', '2020-01-01', 3240),
    (ep2pod1, podcast1, 'Episodio 2', 'Descrição do episódio 2', '2020-01-08', 3045),
    (ep3pod1, podcast1, 'Episodio 3', 'Descrição do episódio 3', '2020-01-15', 4217),
    (ep4pod1, podcast1, 'Episodio 4', 'Descrição do episódio 4', '2020-01-22', 1843),
    (ep5pod1, podcast1, 'Episodio 5', 'Descrição do episódio 5', '2020-01-29', 2726),
    (ep1pod2, podcast2, 'Ep 1', 'Descrição do episódio 1', '2014-04-06', 1429),
    (ep2pod2, podcast2, 'Ep 2', 'Descrição do episodio 2', '2014-04-08', 1863),
    (ep3pod2, podcast2, 'Ep 3', 'Descrição do episodio 3', '2014-04-10', 1275),
    (ep4pod2, podcast2, 'Ep 4', 'Descrição do episodio 4', '2014-04-12', 1423),
    (ep5pod2, podcast2, 'Ep 5', 'Descrição do episodio 5', '2014-04-14', 1348),
    (ep1pod3, podcast3, 'Episodio 1', 'Descrição do episódio 1', '2019-03-01', 3240),
    (ep2pod3, podcast3, 'Episodio 2', 'Descrição do episódio 2', '2019-03-08', 3045),
    (ep3pod3, podcast3, 'Episodio 3', 'Descrição do episodio 3', '2019-03-15', 4217),
    (ep4pod3, podcast3, 'Episodio 4', 'Descrição do episodio 4', '2019-03-22', 1843),
    (ep5pod3, podcast3, 'Episodio 5', 'Descrição do episodio 5', '2019-03-29', 2726),
    (ep6pod3, podcast3, 'Episodio 6', 'Descrição do episodio 6', '2019-04-05', 4293),
    (ep7pod3, podcast3, 'Episodio 7', 'Descrição do episodio 7', '2019-04-12', 1263),
    (ep8pod3, podcast3, 'Episodio 8', 'Descrição do episodio 8', '2019-04-19', 2526),
    (ep9pod3, podcast3, 'Episodio 9', 'Descrição do episodio 9', '2019-04-26', 2726),
    (ep10pod3, podcast3, 'Episodio 10', 'Descrição do episodio 10', '2019-05-03', 2726),
    (ep1pod4, podcast4, 'Ep1', 'Descrição do episodio 1', '2024-05-10', 3426),
    (ep2pod4, podcast4, 'Ep2', 'Descrição do episodio 2', '2024-05-17', 4536),
    (ep3pod4, podcast4, 'Ep3', 'Descrição do episodio 3', '2024-05-24', 2576),
    (ep4pod4, podcast4, 'Ep4', 'Descrição do episodio 4', '2024-05-31', 3676),
    (ep5pod4, podcast4, 'Ep5', 'Descrição do episodio 5', '2024-06-07', 3426),
    (ep6pod4, podcast4, 'Ep6', 'Descrição do episodio 6', '2024-06-14', 4536),
    (ep7pod4, podcast4, 'Ep7', 'Especial de Natal!', '2024-12-25', 2576);



    
    
    