DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Artista;
DROP TABLE IF EXISTS Utilizador;
DROP TABLE IF EXISTS Contacto;
DROP TABLE IF EXISTS NomeUtilizador;
DROP TABLE IF EXISTS PlanoAssinatura;
DROP TABLE IF EXISTS Playlist;
DROP TABLE IF EXISTS Criador;
DROP TABLE IF EXISTS Musica;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Podcast;
DROP TABLE IF EXISTS Episodio;
DROP TABLE IF EXISTS Genero;
DROP TABLE IF EXISTS Tema;
DROP TABLE IF EXISTS OuviuMusica;
DROP TABLE IF EXISTS OuviuEpisodio;
DROP TABLE IF EXISTS SeguiuUtilizador;
DROP TABLE IF EXISTS SeguiuArtista;
DROP TABLE IF EXISTS SeguiuCriador;
DROP TABLE IF EXISTS GostouAlbum;
DROP TABLE IF EXISTS GostouEpisodio;
DROP TABLE IF EXISTS GostouMusica;
DROP TABLE IF EXISTS Colaborador;
DROP TABLE IF EXISTS GuardouPlaylist;
DROP TABLE IF EXISTS ArtistaMusica;
DROP TABLE IF EXISTS MusicaPlaylist;
DROP TABLE IF EXISTS MusicaGenero;
DROP TABLE IF EXISTS PodcastGenero;
DROP TABLE IF EXISTS PodcastEpisodio;
DROP TABLE IF EXISTS CriadorPodcast;
DROP TABLE IF EXISTS EpisodioTema;

CREATE TABLE Pessoa
(
	userID INT NOT NULL UNIQUE, 
	nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50) NOT NULL, 
    fotoPerfil BLOB, 
    PRIMARY KEY (userID)
);

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

CREATE TABLE Utilizador
(
    userID INT NOT NULL UNIQUE,
    nomeUtilizador INT NOT NULL UNIQUE,
    palavrapasse VARCHAR(35) NOT NULL CHECK (LENGTH(palavrapasse) >= 8),
    contacto INT NOT NULL UNIQUE,
    dataNascimento DATE NOT NULL,
    assinaturaID INT NOT NULL,
    PRIMARY KEY (userID),
    FOREIGN KEY (userID) REFERENCES Pessoa(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (assinaturaID) REFERENCES PlanoAssinatura(assinaturaID)
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE,
    FOREIGN KEY (contacto) REFERENCES Contacto(contactoID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    FOREIGN KEY (nomeUtilizador) REFERENCES NomeUtilizador(nomeUtilizadorID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

CREATE TABLE Contacto
(
    contactoID INT NOT NULL UNIQUE,
    contacto VARCHAR(35) NOT NULL UNIQUE,
    PRIMARY KEY (contactoID)
);

CREATE TABLE NomeUtilizador
(
    nomeUtilizadorID INT NOT NULL UNIQUE,
    nomeUtilizador VARCHAR(25) NOT NULL UNIQUE CHECK (LENGTH(nomeUtilizador) > 3),
    PRIMARY KEY (nomeUtilizadorID)
);

CREATE TABLE PlanoAssinatura
(
    assinaturaID INT DEFAULT 0,
    assinatura VARCHAR(15) NOT NULL,
    PRIMARY KEY (assinaturaID)
);

CREATE TABLE Criador
(
    criadorID INT NOT NULL UNIQUE,
    biografia TEXT,
    PRIMARY KEY (criadorID),
    FOREIGN KEY (criadorID) REFERENCES Pessoa(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Playlist
(
    playlistID INT NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (playlistID)
);

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

CREATE TABLE Album
(
    albumID INT NOT NULL UNIQUE,
    nome VARCHAR(75) NOT NULL,
    dataLancamento DATE NOT NULL,
    fotoCapa BLOB,
    PRIMARY KEY (albumID)
);

CREATE TABLE Podcast
(
    podcastID INT UNIQUE NOT NULL,
    nome VARCHAR(75) NOT NULL,
    fotoCapa BLOB,
    PRIMARY KEY (podcastID)
);

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

CREATE TABLE Genero
(
    generoID INT NOT NULL UNIQUE,
    genero VARCHAR(25) NOT NULL,
    PRIMARY KEY (generoID)
);

CREATE TABLE Tema
(
    temaID INT NOT NULL UNIQUE,
    tema VARCHAR(25) NOT NULL, 
    PRIMARY KEY (temaID)
);

CREATE TABLE OuviuMusica
(
    musicaID INT NOT NULL,
    userID INT NOT NULL ,
    dataHora TIMESTAMP NOT NULL,
    PRIMARY KEY (musicaID, userID),
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE OuviuEpisodio
(
    episodioID INT NOT NULL,
    userID INT NOT NULL,
    dataHora TIMESTAMP NOT NULL,
    duracaoSeg INT CHECK(duracaoSeg > 0),
    progressoEpisodio Int DEFAULT 0 CHECK(progressoEpisodio <= duracaoSeg),
    PRIMARY KEY (episodioID, userID),
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE

    
);

CREATE TABLE SeguiuUtilizador
(
    seguidor INT NOT NULL,
    seguido INT NOT NULL,
    PRIMARY KEY (seguidor, seguido),
    FOREIGN KEY (seguidor) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (seguido) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE SeguiuArtista
(
    userID INT NOT NULL,
    artistaID INT NOT NULL,
    PRIMARY KEY (userID, artistaID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE SeguiuCriador
(
    userID INT NOT NULL,
    criadorID INT NOT NULL,
    PRIMARY KEY (userID, criadorID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (criadorID) REFERENCES Criador(criadorID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE GostouAlbum
(
    userID INT NOT NULL,
    albumID INT NOT NULL,
    PRIMARY KEY (userID, albumID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (albumID) REFERENCES Album(albumID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE GostouEpisodio
(
    userID INT NOT NULL,
    episodioID INT NOT NULL,
    PRIMARY KEY (userID, episodioID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE GostouMusica
(
    userID INT NOT NULL,
    musicaID INT NOT NULL,
    PRIMARY KEY (userID, musicaID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE Colaborador
(
    userID INT NOT NULL,
    playlistID INT NOT NULL,
    PRIMARY KEY (userID, playlistID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE GuardouPlaylist
(
    userID INT NOT NULL,
    playlistID INT NOT NULL,
    PRIMARY KEY (userID, playlistID),
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE ArtistaMusica
(
    artistaID INT NOT NULL,
    musicaID INT NOT NULL,
    PRIMARY KEY (artistaID, musicaID),
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE MusicaPlaylist
(
    musicaID INT NOT NULL,
    playlistID INT NOT NULL,
    PRIMARY KEY (musicaID, playlistID),
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE MusicaGenero 
(
    musicaID INT NOT NULL,
    generoID INT NOT NULL,
    PRIMARY KEY (musicaID, generoID),
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE PodcastGenero
(
    podcastID INT NOT NULL,
    generoID INT NOT NULL,
    PRIMARY KEY (podcastID, generoID),
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE PodcastEpisodio
(
    podcastID INT NOT NULL,
    episodioID INT NOT NULL,
    PRIMARY KEY (podcastID, episodioID),
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE CriadorPodcast
(
    criadorID INT NOT NULL,
    podcastID INT NOT NULL,
    PRIMARY KEY (criadorID, podcastID),
    FOREIGN KEY (criadorID) REFERENCES Criador(criadorID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE EpisodioTema
(
    episodioID INT NOT NULL,
    temaID INT NOT NULL,
    PRIMARY KEY (episodioID, temaID),
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (temaID) REFERENCES Tema(temaID)
    ON DELETE CASCADE
    ON UPDATE CASCADE 
);