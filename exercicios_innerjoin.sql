/*

Criar tabela de estados (com 2 estados)
- id
- nome
- sigla
Criar tabela de cidades (com 2 cidades por estado)
- id
- nome
- quantidade habitantes
Criar tabela de bairros (com 2 bairros por cidade)
- id
- nome
Criar endereço por bairro (com 1 endereços por bairro)
- id 
- cep
- logradouro
- numero
- complemento

*/

CREATE DATABASE IF NOT EXISTS exercicios_innerjoin;
USE exercicios_innerjoin;

CREATE TABLE estados(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sigla CHAR(2) NOT NULL
);


CREATE TABLE cidades(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    quantidade_habitantes INT NOT NULL,
    estado_id INT NOT NULL,
    FOREIGN KEY (estado_id) REFERENCES estados(id)
);


CREATE TABLE bairros(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cidade_id INT NOT NULL,
    FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);


CREATE TABLE enderecos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro_id INT NOT NULL,
    FOREIGN KEY (bairro_id) REFERENCES bairros(id)
);


INSERT INTO estados (nome, sigla) VALUES 
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ');

INSERT INTO cidades (nome, quantidade_habitantes, estado_id) VALUES 
('São Paulo', 12300000, 1),
('Campinas', 1200000, 1),
('Rio de Janeiro', 6748000, 2),
('Niterói', 500000, 2);

INSERT INTO bairros (nome, cidade_id) VALUES
('Centro', 1),
('Jardins', 1),
('Copacabana', 3),
('Ipanema', 3);

INSERT INTO enderecos (cep, logradouro, numero, complemento, bairro_id) VALUES 
('01001000', 'Rua A', '100', 'Apto 101', 1),
('01002000', 'Rua B', '200', NULL, 2),
('22040001', 'Avenida Atlântica', '3000', NULL, 3),
('22420001', 'Rua Visconde de Pirajá', '400', NULL, 4);


-----------------------------------------------------------------------------------------------

CREATE DATABASE pet_shop;

USE pet_shop;


CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    observacao VARCHAR(500) NOT NULL
);


CREATE TABLE especies(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL
);


CREATE TABLE racas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    id_especie INT NOT NULL,
    FOREIGN KEY (id_especie) REFERENCES especies(id)
);


CREATE TABLE pets(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    data_nascimento DATE,
    id_cliente INT NOT NULL,
    id_raca INT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_raca) REFERENCES racas(id)
);


INSERT INTO clientes (nome, observacao) VALUES
("Nome 1", "Observaçâo1"),
("Nome 2", "Observaçâo2"),
("Nome 3", "Observaçâo3"),
("Nome 4", "Observaçâo4");

SELECT nome, observacao FROM clientes;

ALTER TABLE clientes ADD COLUMN sobrenome VARCHAR(30);


SELECT nome, observacao, sobrenome FROM clientes;


UPDATE clientes SET sobrenome = "Sobrenome 1" WHERE id = 1;
UPDATE clientes SET sobrenome = "Sobrenome 2" WHERE id = 2;
UPDATE clientes SET sobrenome = "Sobrenome 3" WHERE id = 3;
UPDATE clientes SET sobrenome = "Sobrenome 4" WHERE id = 4;


SELECT nome, observacao, sobrenome FROM clientes;


ALTER TABLE clientes ADD COLUMN telefone VARCHAR(20);


SELECT nome, observacao, sobrenome, telefone FROM clientes;


UPDATE clientes SET telefone = "telefone 1" WHERE id = 1;
UPDATE clientes SET telefone = "telefone 2" WHERE id = 2;
UPDATE clientes SET telefone = "telefone 3" WHERE id = 3;
UPDATE clientes SET telefone = "telefone 4" WHERE id = 4;

SELECT nome, observacao, sobrenome, telefone FROM clientes;


INSERT INTO especies (nome) VALUES
("Gato"),
("Cachorro"),
("Coelho"),
("Ave");


SELECT nome FROM especies;


INSERT INTO racas (nome, id_especie) VALUES
("Siamês", 1),
("Persa", 1),
("Labrador", 2),
("Poodle", 2),
("Mini Lop", 3),
("Angorá", 3),
("Calopsita", 4),
("Canário", 4);


SELECT 
    racas.nome,
    racas.id_especie,
    especies.nome
    
FROM racas
INNER JOIN especies ON (racas.id_especie = especies.id);


INSERT INTO pets (nome, data_nascimento, id_cliente, id_raca) VALUES
("Mimi", "2021-03-15", 1, 1),
("Luna", "2020-07-22", 1, 2),
("Rex", "2019-11-05", 2, 3),
("Bob", "2022-01-30", 2, 4),
("Fofinho", "2021-06-18", 3, 5),
("Nino", "2020-09-09", 3, 6),
("Piu", "2022-04-12", 4, 7),
("Amarelinho", "2021-12-01", 4, 8);


ALTER TABLE pets ADD COLUMN sexo CHAR(1), ADD COLUMN peso DECIMAL(10, 2);


UPDATE pets SET sexo = "M", peso = 10.5 WHERE id = 1;
UPDATE pets SET sexo = "F", peso = 200.12 WHERE id = 2;
UPDATE pets SET sexo = "M", peso = 3009.12 WHERE id = 5;
UPDATE pets SET sexo = "F", peso = 400.12 WHERE id = 6;
UPDATE pets SET sexo = "M", peso = 500.12 WHERE id = 7;
UPDATE pets SET sexo = "F", peso = 600.12 WHERE id = 8;


SELECT 
    pets.nome,
    pets.data_nascimento
FROM pets;


SELECT 
    pets.nome,
    DATE_FORMAT(pets.data_nascimento, "%d/%m/%Y") AS "Data de nascimento",
    pets.sexo,
    pets.peso,
    racas.nome AS "Raça",
    racas.id_especie AS "Id Especie",
    especies.nome AS "Especie",
    clientes.nome AS "Cliente",
    clientes.observacao
FROM pets
INNER JOIN racas ON (pets.id_raca = racas.id)
INNER JOIN especies ON (racas.id_especie = especies.id)
INNER JOIN clientes ON (pets.id_cliente = clientes.id);


SELECT 
    pets.nome,
    DATE_FORMAT(pets.data_nascimento, "%d/%m/%Y") AS "Data de nascimento",
    pets.sexo,
    pets.peso,
    racas.nome AS "Raça",
    racas.id_especie AS "Id Especie",
    especies.nome AS "Especie",
    clientes.nome AS "Cliente",
    clientes.observacao
FROM pets
INNER JOIN racas ON (pets.id_raca = racas.id)
INNER JOIN especies ON (racas.id_especie = especies.id)
INNER JOIN clientes ON (pets.id_cliente = clientes.id)
WHERE peso IS NULL;


