DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE biblioteca;

USE biblioteca

CREATE TABLE categorias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50), NOT NULL
);


CREATE TABLE livros(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

INSERT INTO categorias (nome) VALUES
("Crítica"),
("Comédia"),
("Aventura");

SELECT id, nome FROM categorias;
SELECT id, nome, id_categoria FROM livros;

INSERT INTO categorias(nome) VALUES ("Motivação")

INSERT INTO livros (nome, id_categoria) VALUES
("Evolução dos bichos", 1),
("Bug brother e a mentira", 1),
("Diário de um banana", 2),
("Mônica", 2),
("Percy Jackson", 3),
("Hábitos Atômicos", 4);

SELECT id, nome FROM categorias;

SELECT
    livros.id,
    livros.nome AS "Livro",
    categorias.nome AS "Categoria"
FROM livros
INNER JOIN categorias ON (livros.id_categoria = categorias.id);