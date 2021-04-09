DROP SCHEMA if exists instagram;
CREATE SCHEMA IF NOT EXISTS instagram;
USE instagram;

CREATE TABLE usuarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR (256) NOT NULL
);
CREATE TABLE posts (
	id INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(100) NOT NULL,
    img VARCHAR(100),
    usuarios_id INT,
    n_likes INT not null default 0,
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON DELETE CASCADE
    
);
CREATE TABLE comentarios (
	id INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT NOT NULL,
    usuarios_id INT,
    posts_id INT,
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (posts_id) REFERENCES posts(id) ON DELETE CASCADE
);

-- ADICIONAR DADOS USUARIOS
INSERT INTO usuarios
	(nome, email, senha)
VALUES
	('Gabriel Brunetti', 'gbrunetti@digitalhouse.com', '12341231312'),
	('Sergio Siqueira', 'ssiqueira@digitalhouse.com', '12341231312'),
	('Felipe Veronesi', 'fveronesi@digitalhouse.com', '12341231312'),
    ('Hendy Almeida', 'halmeida@digitalhouse.com', '1234125412');

-- ADICIONANDO DADOS A POSTS
INSERT INTO posts
	(texto, img, usuarios_id)
VALUES
	('Oi gente tudo bem?', null, 1),
	('Como foi o fim de semana?', null, 1);

-- ADICIONANDO DADOS A COMENTARIOS
INSERT INTO comentarios (texto, usuarios_id,posts_id)
VALUES
	('Oi! Tirando os problemas, tudo certo!',2,1),
	('Oi gente é o !@#!$%! Meu nome agora é Zé Pequeno!',3,1),
    ('Oi pra você também,!',4,1),
    ('Fim de semana já não existe mais!',2,2),
	('FDS nervoso!',3,2),
    ('Fim de semana foi lindo!',4,2);