CREATE DATABASE restau_calabresa;

--Definir qual banco usar
USE restau_calabresa;


--Criar tabela
CREATE TABLE funcionarios(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cargo VARCHAR(100),
    data_nascimento DATE,
    salario DECIMAL(10,2)
);

-- Apresentar tabelas
SHOW TABLES;

--Descrever tabela
DESCRIBE funcionarios


-- Cadastrar um registro
-- INSERT INTO <nome> (colunas) VALUE (valores)
INSERT INTO funcionarios (nome) VALUE ("Justin Biber");

--Consultar os registros
--SELECT colunas FROM tabela
SELECT id, nome FROM funcionarios;

--Adicionar coluna em tabela existente
--ALTER TABLE <nome_tabela> ADD COLUMN <nome_coluna> <TIPO_COLUNA>
ALTER TABLE funcionarios ADD COLUMN cargo VARCHAR(100);

--Consultar os registros
SELECT id, nome, cargo FROM funcionarios;

--Adicionar coluna data nascimento
ALTER TABLE funcionarios ADD COLUMN data_nascimento DATE;

--Adicionar coluna salario
ALTER TABLE funcionarios ADD COLUMN salario DECIMAL(10,2);

--Consultar todas as colunas da tabela funcionarios
SELECT id, nome, cargo, data_nascimento, salario FROM funcionarios;

--Atualizar dados do registro
--UPDATE <nome_tabela> SET <coluna> = <valor>;
UPDATE clientes SET status = "PENDENTE" WHERE id = 91;

--Atualizar mais de uma coluna por vez
UPDATE funcionarios SET cargo = "Gerente", data_nascimento = "1990-01-01", salario = 5000.00 WHERE id = 1;


--Atualizar varias colunas por vez
INSERT INTO funcionarios (nome, cargo, data_nascimento, salario) VALUES ("Elias da silva", "Caixa", "2000-07-12", 1996.50);
INSERT INTO funcionarios (nome, cargo, data_nascimento, salario) VALUES ("Victor sem C", "Manobrista", "2012-09-29", 300.00);
INSERT INTO funcionarios (nome, cargo, data_nascimento, salario) VALUES ("Peter souza", "Cozinheiro junior", "1995-02-28", 6795.30);

--Consultar todas as colunas da tabela funcionarios
SELECT id, nome, cargo, data_nascimento, salario FROM funcionarios;


CREATE TABLE mesas(
    id int PRIMARY KEY AUTO_INCREMENT,
    numero_mesa VARCHAR(100),
    lugares int
);


CREATE TABLE pratos_feitos(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    custo DECIMAL(10,2)
);


CREATE TABLE pedidos(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome int,
    documento VARCHAR(100),
    telefone VARCHAR(100)
);


CREATE TABLE bebidas(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    tipo VARCHAR(100),
    preco DECIMAL(10,2)
);