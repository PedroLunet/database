
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