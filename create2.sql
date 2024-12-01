DROP TABLE IF EXISTS Pessoa;
CREATE TABLE Pessoa
(
	userID INT NOT NULL UNIQUE, 
	nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50) NOT NULL, 
    fotoPerfil BLOB, 
    PRIMARY KEY (userID)
);

DROP TABLE IF EXISTS Artista;
CREATE TABLE Artista
(   
    artistaID INT NOT NULL UNIQUE,
    biografia TEXT,
    proximosEventos TEXT,
    PRIMARY KEY (artistaID),
    FOREIGN KEY (artistaID) REFERENCES Pessoa(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Utilizador;
CREATE TABLE Utilizador
(
    userID INT NOT NULL UNIQUE,
    nomeUtilizador INT NOT NULL UNIQUE,
    palavrapasse VARCHAR(35) NOT NULL CHECK (LENGTH(palavrapasse) >= 8),
    contacto INT NOT NULL UNIQUE,
    dataNascimento DATE NOT NULL,
    assinaturaID INT,
    PRIMARY KEY (userID),
    FOREIGN KEY (userID) REFERENCES Pessoa(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (assinaturaID) REFERENCES PlanoAssinatura(subscriptionID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    FOREIGN KEY (contacto) REFERENCES Contacto(contactoID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    FOREIGN KEY (nomeUtilizador) REFERENCES NomeUtilizador(nomeUtilizadorID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Contacto;
CREATE TABLE Contacto
(
    contactoID INT NOT NULL UNIQUE,
    contacto VARCHAR(35) NOT NULL UNIQUE,
    PRIMARY KEY (contactoID)
);

DROP TABLE IF EXISTS NomeUtilizador;
CREATE TABLE NomeUtilizador
(
    nomeUtilizadorID INT NOT NULL UNIQUE,
    nomeUtilizador VARCHAR(25) NOT NULL UNIQUE CHECK (LENGTH(nomeUtilizador) > 3),
    PRIMARY KEY (nomeUtilizadorID)
);

DROP TABLE IF EXISTS PlanoAssinatura;
CREATE TABLE PlanoAssinatura
(
    assinaturaID INT,
    assinatura VARCHAR(15) NOT NULL,
    PRIMARY KEY (assinaturaID)
);

DROP TABLE IF EXISTS Criador;
CREATE TABLE Criador
(
    criadorID INT NOT NULL UNIQUE,
    biografia TEXT,
    PRIMARY KEY (criadorID),
    FOREIGN KEY (criadorID) REFERENCES Pessoa(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Playlist;
CREATE TABLE Playlist
(
    playlistID INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (playlistID)
);

DROP TABLE IF EXISTS Musica;
CREATE TABLE Musica
(
    musicaID INT NOT NULL UNIQUE,
    album INT NOT NULL,
    nome VARCHAR(75) NOT NULL,
    duracaoSeg INT CHECK(duracaoSeg > 0),
    fotoCapa BLOB,
    PRIMARY Key (musicaID),
    FOREIGN KEY (album) REFERENCES Album(albumID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Album;
CREATE TABLE Album
(
    albumID INT NOT NULL UNIQUE,
    nome VARCHAR(75) NOT NULL,
    dataLancamento DATE NOT NULL,
    fotoCapa BLOB,
    PRIMARY KEY (albumID)
);

DROP TABLE IF EXISTS Podcast;
CREATE TABLE Podcast
(
    podcastID INT UNIQUE NOT NULL,
    nome VARCHAR(75) NOT NULL,
    fotoCapa BLOB,
    PRIMARY KEY (podcastID)
);

DROP TABLE IF EXISTS Episodio;
CREATE TABLE Episodio
(
    episodioID INT UNIQUE NOT NULL,
    podcast INT NOT NULL,
    nome VARCHAR(75) NOT NULL,
    descricao TEXT,
    dataLancamento DATE NOT NULL,
    duracaoSeg INT CHECK(duracaoSeg > 0),
    PRIMARY KEY (episodioID), 
    FOREIGN KEY (podcast) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Genero;
CREATE TABLE Genero
(
    generoID INT NOT NULL UNIQUE,
    genero VARCHAR(25) NOT NULL,
    PRIMARY KEY (generoID)
);

DROP TABLE IF EXISTS Tema;
CREATE TABLE Tema
(
    temaID INT NOT NULL UNIQUE,
    tema VARCHAR(25) NOT NULL, 
    PRIMARY KEY (temaID)
);

DROP TABLE IF EXISTS OuviuMusica;
CREATE TABLE OuviuMusica
(
    musicaID INT NOT NULL UNIQUE,
    userID INT NOT NULL UNIQUE,
    dataHora TIMESTAMP NOT NULL,
    PRIMARY KEY (musicaID, userID),
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS OuviuEpisodio;
CREATE TABLE OuviuEpisodio
(
    episodioID INT NOT NULL UNIQUE,
    userID INT NOT NULL UNIQUE,
    dataHora TIMESTAMP NOT NULL,
    progressoEpisodio TIMESTAMP DEFAULT 0 CHECK(progressoEpisodio <= Episodio.duracaoSeg),
    PRIMARY KEY (episodioID, userID),
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SeguiuUtilizador;
CREATE TABLE SeguiuUtilizador
(
    seguidor INT NOT NULL UNIQUE,
    seguido INT NOT NULL UNIQUE,
    PRIMARY KEY (seguidor, seguido),
    FOREIGN KEY (seguidor) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (seguido) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SeguiuArtista;
CREATE TABLE SeguiuArtista
(
    userID INT NOT NULL UNIQUE,
    artistaID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, artistaID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS SeguiuCriador;
CREATE TABLE SeguiuCriador
(
    userID INT NOT NULL UNIQUE,
    artistaID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, artistaID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS GostouAlbum;
CREATE TABLE GostouAlbum
(
    userID INT NOT NULL UNIQUE,
    albumID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, albumID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (albumID) REFERENCES Album(albumID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS GostouEpisodio;
CREATE TABLE GostouEpisodio
(
    userID INT NOT NULL UNIQUE,
    episodioID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, episodioID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS GostouMusica;
CREATE TABLE GostouMusica
(
    userID INT NOT NULL UNIQUE,
    musicaID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, musicaID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Colaborador;
CREATE TABLE Colaborador
(
    userID INT NOT NULL UNIQUE,
    playlistID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, playlistID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS GuardouPlaylist;
CREATE TABLE GuardouPlaylist
(
    userID INT NOT NULL UNIQUE,
    playlistID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, playlistID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ArtistaMusica;
CREATE TABLE ArtistaMusica
(
    artistaID INT NOT NULL UNIQUE,
    musicaID INT NOT NULL UNIQUE,
    PRIMARY KEY (artistaID, musicaID),
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS MusicaPlaylist;
CREATE TABLE MusicaPlaylist
(
    musicaID INT NOT NULL UNIQUE,
    playlistID INT NOT NULL UNIQUE,
    PRIMARY KEY (musicaID, playlistID),
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS MusicaGenero;
CREATE TABLE MusicaGenero 
(
    musicaID INT NOT NULL UNIQUE,
    generoID INT NOT NULL UNIQUE,
    PRIMARY KEY (musicaID, playlistID),
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS PodcastGenero;
CREATE TABLE PodcastGenero
(
    podcastID INT NOT NULL UNIQUE,
    generoID INT NOT NULL UNIQUE,
    PRIMARY KEY (podcastID, generoID),
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS PodcastEpisodio;
CREATE TABLE PodcastEpisodio
(
    podcastID INT NOT NULL UNIQUE,
    episodioID INT NOT NULL UNIQUE,
    PRIMARY KEY (podcastID, episodioID),
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS CriadorPodcast;
CREATE TABLE CriadorPodcast
(
    criadorID INT NOT NULL UNIQUE,
    podcastID INT NOT NULL UNIQUE,
    PRIMARY KEY (criadorID, podcastID),
    FOREIGN KEY (criadorID) REFERENCES Criador(criadorID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS EpisodioTema;
CREATE TABLE EpisodioTema
(
    episodioID INT NOT NULL UNIQUE,
    temaID INT NOT NULL UNIQUE,
    PRIMARY KEY (episodioID, temaID),
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (temaID) REFERENCES Tema(temaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE 
);
