-- Aluno: [Beatriz Ribeiro]
-- Numero: [a22503692]
-- Turma: [LCiDa01]
-- Horário: [27/10/2026, 8:45]
-- Caso de estudo: [Actor de Filme]

--1. Cria o modelo com as Tabelas indicadas num novo schema com o teu numero de aluno--
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'a22503692')
BEGIN
    EXEC('CREATE SCHEMA a22503692');
END;
GO

CREATE TABLE a22503692.ACTORES(
    id_actor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

CREATE TABLE a22503692.FILMES(
    id_filme INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento INT NOT NULL,
    genero VARCHAR(50) NOT NULL
);

CREATE TABLE a22503692.FILMES_ACTORES(
    id_filme INT NOT NULL,
    id_actor INT NOT NULL,
    papel VARCHAR(20) NOT NULL
        CONSTRAINT DF_FILMES_ACTORES_papel DEFAULT 'Figurante'
        CHECK (papel IN ('Protagonista', 'Secundário', 'Figurante')),
    CONSTRAINT PK_FILMES_ACTORES PRIMARY KEY (id_filme, id_actor),
    CONSTRAINT FK_FILMES_ACTORES_FILMES FOREIGN KEY (id_filme)
        REFERENCES a22503692.FILMES (id_filme)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT FK_FILMES_ACTORES_ACTORES FOREIGN KEY (id_actor)
        REFERENCES a22503692.ACTORES (id_actor)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

SELECT * FROM a22503692.ACTORES;
SELECT * FROM a22503692.FILMES;
SELECT * FROM a22503692.FILMES_ACTORES;

--2. Insere pelo menos 2 registos em cada tabela, mas garante que existe um filme com apenas 1 actor, outro com 3 e 1 actor que não está em nenhum filme
INSERT INTO a22503692.ACTORES(id_actor, nome, data_nascimento, nacionalidade)
VALUES (1, 'Carlos Almeida', '1978-10-27', 'Portugues'),
       (2, 'Maria Eduarda Silva', '1989-05-28', 'Portuguesa'),
       (3, 'João Pedro Santos', '1995-03-15', 'Portugues'),
       (4, 'Ana Beatriz Costa', '1990-07-12', 'Portuguesa'),
       (5, 'Rui Gomes', '1984-02-18', 'Portugues');

INSERT INTO a22503692.FILMES(id_filme, titulo, ano_lancamento, genero)
VALUES (1, 'O Filme', 2020, 'Ação'),
       (2, 'Os cinco', 2010, 'Ação');

INSERT INTO a22503692.FILMES_ACTORES(id_filme, id_actor, papel)
VALUES (1, 1, 'Protagonista'),
       (2, 2, 'Protagonista'),
       (2, 3, 'Secundário'),
       (2, 4, 'Figurante');

--3.Após as inserções, altera a tabela adequada para incluir a função do actor em cada filme. O campo é de preenchimento obrigatório e só pode ter os valores protagonista, secundário ou figurante
-- (A função já foi incluída na tabela de associação FILMES_ACTORES.)

--4.Filme errado! muda o código de um filme com actores associados
UPDATE a22503692.FILMES
SET id_filme = 10
WHERE id_filme = 1;

--5. Apaga um actor existente num filme
DELETE FROM a22503692.ACTORES
WHERE id_actor = 3;

--6. Apaga todos os dados
DELETE FROM a22503692.FILMES_ACTORES;
DELETE FROM a22503692.ACTORES;
DELETE FROM a22503692.FILMES;

--7. Apaga as tabelas e o schema
DROP TABLE a22503692.FILMES_ACTORES;
DROP TABLE a22503692.FILMES;
DROP TABLE a22503692.ACTORES;
DROP SCHEMA a22503692;