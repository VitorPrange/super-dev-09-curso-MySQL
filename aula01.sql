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
    nome VARCHAR(100),
    documento VARCHAR(100),
    telefone VARCHAR(100)
);


CREATE TABLE bebidas(
    id int PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    tipo VARCHAR(100),
    preco DECIMAL(10,2)
);


INSERT INTO mesas (numero_mesa, lugares) VALUES ("002", 12);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("003", 4);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("004", 8);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("005", 5);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("006", 9);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("007", 5);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("008", 3);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("009", 2);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("010", 1);
INSERT INTO mesas (numero_mesa, lugares) VALUES ("001", 7);


INSERT INTO pratos_feitos (nome, custo) VALUES ("X-Calabresa sem carne", 60.90);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Pizza de Calabresa de 10cm", 25.00);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Folhado de Calabresa", 17.28);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Kalzone de Calabresa", 86.45);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Calabresa Cheddar e Batata Frita", 9.75);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Calabresa no Pão de queijo", 133.35);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Pirão banco com calabresa e ovo", 17.55);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Pão de alho e calabresa", 67.77);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Sopa de cala com lingua de boi", 100.60);
INSERT INTO pratos_feitos (nome, custo) VALUES ("Fondue de Chocolate", 823.40);


INSERT INTO pedidos (nome, documento, telefone) VALUES ("Luquita da galera", "24.740.464/0001-00", "(96) 3741-5005");
INSERT INTO pedidos (nome, documento, telefone) VALUES ("Leandro Antonio Melo", "834.931.626-85", "(71) 2929-9455");
INSERT INTO pedidos (nome, documento, telefone) VALUES ("Isis Rebeca Vanessa Sales", "936.423.500-20", "(11) 98693-3252");


INSERT INTO bebidas (nome, tipo, preco) VALUES ("Laranjinha", "Refrigerante", 18.00);
INSERT INTO bebidas (nome, tipo, preco) VALUES ("Fruki", "Refrigerante", 10.00);
INSERT INTO bebidas (nome, tipo, preco) VALUES ("Corote", "Vodka", 27.00);
INSERT INTO bebidas (nome, tipo, preco) VALUES ("Vinho Campo Largo 750ml", "Vinho", 74.43);
INSERT INTO bebidas (nome, tipo, preco) VALUES ("Del Valle 100% Laranja 1L", "Suco", 66.50);