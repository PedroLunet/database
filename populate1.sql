PRAGMA FOREIGN_KEYS=ON;

INSERT INTO PlanoAssinatura (assinaturaID, assinatura)
VALUES
    (1, "Gratis"),
    (2, "Premium");


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
    (utilizador1, 'joaosilva', '12345678', '8hjgJhj67fj', '912345678','1990-01-01', 1),
    
    