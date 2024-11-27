
CREATE TABLE Person
(
	userID NUMERIC UNIQUE, 
	NAME TEXT NOT NULL Constraint ,
    location TEXT, 
    profilePic TEXT, 
    PRIMARY KEY (userID)

);
CREATE TABLE Artist
(   
    userID NUMERIC,
    biography TEXT,
    nextEvents TEXT,
    FOREIGN KEY (userID) REFERENCES Person(userID)
);

CREATE TABLE User
(
    userID NUMERIC,
    password blob NOT NULL Constraint,
    contact NUMERIC,
    birthdate DATE NOT NULL Constraint,
    FOREIGN KEY (userID) REFERENCES Person(userID)

);
CREATE TABLE PlanoAssinatura
(

);

CREATE TABLE Criador
(
    userID NUMERIC,
    biography TEXT,
    FOREIGN KEY (userID) REFERENCES Person(userID)
);

CREATE TABLE Playlist
(
    playlistID NUMERIC UNIQUE,
    name TEXT NOT NULL Constraint,
    PRIMARY KEY (playlistID)
);

CREATE TABLE Music
(
    Album NUMERIC,
    musicID NUMERIC UNIQUE,
    name TEXT,
    durationSec NUMERIC,
    numReproductions NUMERIC,
    coverPhoto TEXT,
    PRIMARY Key (musicID),
    FOREIGN KEY (Album) REFERENCES Album(albumid)
);


CREATE TABLE Album
(
    albumID NUMERIC UNIQUE,
    name TEXT,
    releaseDate DATE,
    photo TEXT,
    PRIMARY KEY (albumID)

);
CREATE TABLE Podcast
(
    podcastID NUMERIC UNIQUE NOT NULL,
    name TEXT NOT NULL,
    photo TEXT,
    PRIMARY KEY (podcastID)
    
);

CREATE TABLE Episode
(
    Podcast NUMERIC,
    episodeID NUMERIC UNIQUE NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    releaseDate DATE,
    photo TEXT,
    PRIMARY KEY (episodeID), 
    FOREIGN KEY (Podcast) REFERENCES Podcast(podcastID)
):

CREATE TABLE Genre
(
    genre TEXT
):

CREATE TABLE Theme
(
    theme TEXT
):



/*
Pessoa (userID, nome, localizacao, fotoPerfil)
Artista (artistID -> Pessoa.userID, biografia, proximosEventos)
Utilizador (userID -> Pessoa.userID, nomeUtilizador, password, contacto, dataNascimento, assinaturaID -> PlanoAssinatura)
PlanoAssinatura (assinaturaID, assinatura)
Criador (creatorID -> Pessoa.userID, biografia)
Playlist (playlistID, nome, descricao, dataCriacao, foto, userID -> Utilizador)
Musica (musicaID, nome, duracaoSeg, numReproducoes, fotoCapa, albumID -> Album)
Album (albumID, nome, dataLancamento, foto)
Podcast (podcastID, nome, foto)
Episodio (episodioID, nome, descricao, dataLancamento, duracaoSeg)
Genero (generoID, genero)
Tema (temaID, tema)
—-------------------------------------------------------------------------------------------------------------------------
OuviuMusica (episodioID -> Episodio, userID -> Utilizador, timeStamp, progressoEpisodio )
OuviuEpisodio (musicaID -> Musica, userID -> Utilizador, timeStamp)
—-------------------------------------------------------------------------------------------------------------------------
SeguiuUser (userID1 -> Utilizador, userID2 -> Utilizador)
SeguiuArtista (userID -> Utilizador, artistID -> Artista)
SeguiuCriador (userID -> Utilizador, creatorID -> Criador)

GostouAlbum (userID -> Utilizador, albumID -> Album)
GostouEpisodio (userID -> Utilizador, espisodioID -> Episodio)
GostouMusica (userID -> Utilizador, musicaID -> Musica)

Colaborador (userID -> Utilizador, playlistID -> Playlist)
Guardou (userID -> Utilizador, playlistID -> Playlist)

ArtistaMusica (userID -> Artista, musicaID -> Musica)
MusicaPlaylist (musicaID -> Musica, playlistID -> Playlist)
MusicaGenero (musicaID -> Musica, generoID -> Genero)
PodcastGenero (musicaID -> Musica, podcastID -> Podcast)
PodcastEpisodio ( podcastID -> Podcast, episodioID -> Episodio)
CriadorPodcast (userID -> Criador, podcastID -> Podcast)
EpisodioTema (episodioID -> Episodio, temaID -> Tema)

*/
