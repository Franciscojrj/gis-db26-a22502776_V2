/*Q1*/
CREATE SCHEMA a22502776;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'a22502776';

CREATE TABLE a22502776.aluno (
    id_aluno INT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    curso VARCHAR(100) NOT NULL
);

CREATE TABLE a22502776.estagio (
    id_aluno INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NULL,
    empresa VARCHAR(100) NOT NULL,
    funcao VARCHAR(100) NULL,
    CONSTRAINT pk_estagio PRIMARY KEY (id_aluno, data_inicio),
    CONSTRAINT fk_estagio FOREIGN KEY (id_aluno)
        REFERENCES a22502776.aluno (id_aluno)
);

SELECT *
FROM a22502776.aluno;

SELECT *
FROM a22502776.estagio;

/*Q2*/
INSERT INTO a22502776.aluno (id_aluno, nome, email, curso)
VALUES 
    (1, 'aluno 1', 'aluno1@email.com', 'Ciência de Dados'),
    (2, 'aluno 2', 'aluno2@email.com', 'Ciência de Dados'),
    (3, 'aluno 3', 'aluno3@email.com', 'Ciência de Dados');

INSERT INTO a22502776.estagio (id_aluno, data_inicio, data_fim, empresa, funcao)
VALUES (1, '2025-03-20', '2025-12-31', 'Empresa 1', 'Analista'),
    (1, '2026-01-01', GETDATE(), 'Empresa 2', 'Ciêntista'),
    (2, '2026-01-01', GETDATE(), 'Empresa 2', 'Analista');

SELECT *
FROM a22502776.aluno;

SELECT *
FROM a22502776.estagio;

SELECT a22502776.estagio.empresa, a22502776.estagio.funcao, a22502776.aluno.nome AS nome_aluno
FROM a22502776.estagio
INNER JOIN a22502776.aluno ON a22502776.aluno.id_aluno = a22502776.estagio.id_aluno;

SELECT E.empresa, E.funcao, A.nome AS nome_aluno
FROM a22502776.aluno AS A
LEFT JOIN a22502776.estagio AS E ON E.id_aluno = A.id_aluno;


/*Q3*/
ALTER TABLE a22502776.estagio
ADD CONSTRAINT estagio_duracao
CHECK (data_fim IS NULL OR data_fim >= DATEADD(MONTH, 1, data_inicio));

UPDATE a22502776.estagio
SET data_fim = DATEADD(MONTH, 1, data_inicio)
WHERE id_aluno = 1;

SELECT * 
FROM a22502776.estagio
WHERE estagio.data_fim IS NOT NULL;


/*Q4*/
INSERT INTO a22502776.aluno (id_aluno, nome, email, curso)
SELECT 20, nome, email, curso
FROM a22502776.aluno
WHERE id_aluno = 2;

UPDATE a22502776.estagio
SET id_aluno = 20
WHERE id_aluno = 2;

DELETE FROM a22502776.aluno
WHERE id_aluno = 2;

SELECT *
FROM a22502776.aluno;


/*Q5*/
DELETE FROM a22502776.estagio
WHERE id_aluno = 20 AND data_inicio = '2026-01-01';

SELECT *
FROM a22502776.estagio
WHERE id_aluno = 20;


/*Q6*/
DELETE FROM a22502776.aluno;
DELETE FROM a22502776.estagio;

SELECT *
FROM a22502776.aluno;

SELECT *
FROM a22502776.estagio;


/*Q7*/
DROP TABLE a22502776.estagio;
DROP TABLE a22502776.aluno;

DROP SCHEMA a22502776;

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'a22502776';

SELECT name FROM sys.schemas WHERE name = 'a22502776';