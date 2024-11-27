
CREATE TABLE Pessoa
(
	userID INT UNIQUE, 
	nome TEXT NOT NULL Constraint,
    localizacao TEXT, 
    fotoPerfil TEXT, 
    PRIMARY KEY (userID)

);
CREATE TABLE Artista
(   
    artistaID INT,
    biografia TEXT,
    proximosEventos TEXT,
    PRIMARY KEY (artistaID)
    FOREIGN KEY (artistaID) REFERENCES Pessoa(userID)
);

CREATE TABLE Utilizador
(
    userID INT,
    palavrapasse blob NOT NULL Constraint,
    contacto INT,
    dataNascimento DATE NOT NULL Constraint,
    assinaturaID INT NOT NULL,
    PRIMARY KEY (userID)
    FOREIGN KEY (userID) REFERENCES Pessoa(userID)
    FOREIGN KEY (assinaturaID) REFERENCES PlanoAssinatura(subscriptionID)

);
CREATE TABLE PlanoAssinatura
(
    assinaturaID INT NOT NULL UNIQUE,
    assinatura INT NOT NULL,
    PRIMARY KEY (assinaturaID)
);

CREATE TABLE Criador
(
    criadorID INT,
    biografia TEXT,
    FOREIGN KEY (criadorID) REFERENCES Pessoa(userID)
);

CREATE TABLE Playlist
(
    playlistID INT UNIQUE,
    nome TEXT NOT NULL Constraint,
    PRIMARY KEY (playlistID)
);

CREATE TABLE Musica
(
    musicaID INT UNIQUE,
    album INT,
    nome TEXT,
    duracaoSeg INT,
    numReproducoes INT,
    fotoCapa TEXT,
    PRIMARY Key (musicaID),
    FOREIGN KEY (album) REFERENCES Album(albumID)
);

CREATE TABLE Album
(
    albumID INT NOT NULL UNIQUE,
    nome TEXT,
    dataLancamento DATE,
    fotoCapa TEXT,
    PRIMARY KEY (albumID)

);

CREATE TABLE Podcast
(
    podcastID INT UNIQUE NOT NULL,
    nome TEXT NOT NULL,
    fotoCapa TEXT,
    PRIMARY KEY (podcastID)
);

CREATE TABLE Episodio
(
    episodioID INT UNIQUE NOT NULL,
    podcast INT,
    nome TEXT NOT NULL,
    descricao TEXT,
    dataLancamento DATE,
    duracaoSeg INT CHECK(duracaoSeg > 0),
    PRIMARY KEY (episodioID), 
    FOREIGN KEY (podcast) REFERENCES Podcast(podcastID)
):

CREATE TABLE Genero
(
    generoID INT NOT NULL UNIQUE,
    genero TEXT,
    PRIMARY KEY (generoID)
):

CREATE TABLE Tema
(
    temaID INT NOT NULL UNIQUE,
    tema TEXT, 
    PRIMARY KEY (temaID)
):

CREATE TABLE OuviuMusica
(
    musicaID INT NOT NULL UNIQUE,
    userID INT NOT NULL UNIQUE,
    timeStamp TIMESTAMP,
    PRIMARY KEY (musicaID, userID)
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
):

CREATE TABLE OuviuEpisodio
(
    episodioID INT NOT NULL UNIQUE,
    userID INT NOT NULL UNIQUE,
    timeStamp TIMESTAMP,
    progressoEpisodio TIMESTAMP,
    PRIMARY KEY (episodioID, userID)
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
):

CREATE TABLE SeguiuUtilizador
(
    userID1 INT NOT NULL UNIQUE,
    userID2 INT NOT NULL UNIQUE,
    PRIMARY KEY (userID1, userID2)
    FOREIGN KEY (userID1) REFERENCES Utilizador(userID)
    FOREIGN KEY (userID2) REFERENCES Utilizador(userID)
):

CREATE TABLE SeguiuArtista
(
    userID INT NOT NULL UNIQUE,
    artistaID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, artistaID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
):

CREATE TABLE SeguiuCriador
(
    userID INT NOT NULL UNIQUE,
    artistaID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, artistaID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
):

CREATE TABLE GostouAlbum
(
    userID INT NOT NULL UNIQUE,
    albumID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, albumID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (albumID) REFERENCES Album(albumID)
):

CREATE TABLE GostouEpisodio
(
    userID INT NOT NULL UNIQUE,
    episodioID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, episodioID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
):

CREATE TABLE GostouMusica
(
    userID INT NOT NULL UNIQUE,
    musicaID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, musicaID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
):

CREATE TABLE Colaborador
(
    userID INT NOT NULL UNIQUE,
    playlistID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, playlistID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
):

CREATE TABLE GuardouPlaylist
(
    userID INT NOT NULL UNIQUE,
    playlistID INT NOT NULL UNIQUE,
    PRIMARY KEY (userID, playlistID)
    FOREIGN KEY (userID) REFERENCES Utilizador(userID)
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
):

CREATE TABLE ArtistaMusica
(
    artistaID INT NOT NULL UNIQUE,
    musicaID INT NOT NULL UNIQUE,
    PRIMARY KEY (artistaID, musicaID)
    FOREIGN KEY (artistaID) REFERENCES Artista(artistaID)
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
):


CREATE TABLE MusicaPlaylist
(
    musicaID INT NOT NULL UNIQUE,
    playlistID INT NOT NULL UNIQUE,
    PRIMARY KEY (musicaID, playlistID)
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    FOREIGN KEY (playlistID) REFERENCES Playlist(playlistID)
):

CREATE TABLE MusicaGenero 
(
    musicaID INT NOT NULL UNIQUE,
    generoID INT NOT NULL UNIQUE,
    PRIMARY KEY (musicaID, playlistID)
    FOREIGN KEY (musicaID) REFERENCES Musica(musicaID)
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
):

CREATE TABLE PodcastGenero
(
    podcastID INT NOT NULL UNIQUE,
    generoID INT NOT NULL UNIQUE,
    PRIMARY KEY (podcastID, generoID)
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    FOREIGN KEY (generoID) REFERENCES Genero(generoID)
):

CREATE TABLE PodcastEpisodio
(
    podcastID INT NOT NULL UNIQUE,
    episodioID INT NOT NULL UNIQUE,
    PRIMARY KEY (podcastID, episodioID)
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
):

CREATE TABLE CridorPodcast
(
    criadorID INT NOT NULL UNIQUE,
    podcastID INT NOT NULL UNIQUE,
    PRIMARY KEY (criadorID, podcastID)
    FOREIGN KEY (criadorID) REFERENCES Criador(criadorID)
    FOREIGN KEY (podcastID) REFERENCES Podcast(podcastID)
):

CREATE TABLE EpisodioTema
(
    episodioID INT NOT NULL UNIQUE,
    temaID INT NOT NULL UNIQUE,
    PRIMARY KEY (episodioID, temaID)
    FOREIGN KEY (episodioID) REFERENCES Episodio(episodioID)
    FOREIGN KEY (temaID) REFERENCES Tema(temaID)
    
):
