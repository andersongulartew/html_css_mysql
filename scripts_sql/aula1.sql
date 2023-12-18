SELECT * FROM demo;
SELECT Name FROM demo;

DROP TABLE demo;

CREATE TABLE Pessoa(
    ID int NOT NULL UNIQUE,
    NomeCompleto varchar(255) NOT NULL,
    Idade int
);

-- Insert

INSERT INTO Pessoa(
    ID,
    NomeCompleto,
    Idade
)
VALUES (1, 'Nathan Paludo', 30);

-- Alter table

ALTER TABLE Pessoa
ADD Email varchar(128);

-- Mais insert

INSERT INTO Pessoa(
    ID,
    NomeCompleto,
    Idade
)
VALUES (2, 'Maria da Silva', 17, 'mariadasilva@gmail.com');

INSERT INTO Pessoa(
    ID,
    NomeCompleto,
    Idade
)
VALUES (2, 'José Santos', 25, 'josesantos@gmail.com');

-- Where

SELECT * FROM Pessoa;

SELECT ID, NomeCompleto FROM Pessoa
WHERE Idade > 25;

SELECT ID, NomeCompleto FROM Pessoa
WHERE Email IS NULL;

-- Update

UPDATE pessoa 
SET Email = 'natspaludo@gmail.com' 
WHERE ID = 1;

-- Delete

DELETE FROM pessoa
WHERE ID = 2;