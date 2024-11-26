
CREATE TABLE Person
(
	userID Unique NUMERIC, 
	NAME  Text NOT NULL Constraint ,
    location Text, 
    profilePic Text, 
    PRIMARY Key (userID)

);
CREATE TABLE Artist
(   
    userID NUMERIC,
    biography Text,
    Nextevents Text,
    FOREIGN KEY (userID) REFERENCES Person(userID)
);

create Table user
(
    userID NUMERIC,
    password blob NOT NULL Constraint,
    contact NUMERIC,
    birthdate blob NOT NULL Constraint,
    FOREIGN KEY (userID) REFERENCES Person(userID)

);
create Table  PlanoAssinatura();

create Table Criador
(
    userID NUMERIC,
    biography Text,
    FOREIGN KEY (userID) REFERENCES Person(userID)
);

create Table Playlist
(
    playlistID NUMERIC Unique,
    name Text Not Null Constraint,
    PRIMARY KEY (playlistID)
);

create Table Music
(
    Album Numeric,
    musicID NUMERIC Unique,
    name Text,
    durationSec Numeric,
    numReproductions Numeric,
    coverPhoto Text,
    PRIMARY Key (musicID),
    FOREIGN KEY (Album) REFERENCES Album(albumid)
);


CREATE TABLE Album
(
    albumID NUMERIC UNIQUE,
    name TEXT,
    releaseDate TEXT,
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
    releaseDate TEXT,
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

Artista (biografia, proximosEventos)

Utilizador (nomeUtilizador, password, contacto, dataNascimento)
	PlanoAssinatura (assinatura)


Criador (biografia)


Playlist (playlistID, nome, descricao, dataCriacao, foto)

Musica (musicaID, nome, duracaoSeg, numReproducoes, fotoCapa)

Album (albumID, nome, dataLancamento, foto)

Podcast (podcastID, nome, foto)

Episodio (episodioID, nome, descricao, dataLancamento, duracaoSeg)


Genero (genero)

Tema (tema)

—------------

OuviuMu (episodioID -> Episodio, nomeUtilizador -> Utilizador, timeStamp, progressoEpisodio )
OuviuEp (musicaID -> Musica, nomeUtilizador -> Utilizador, timeStamp)

Seguiu (nomeUtilizador1 -> Utilizador, nomeUtilizador2 -> Utilizador)*/
