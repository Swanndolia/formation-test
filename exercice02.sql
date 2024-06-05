CREATE SCHEMA IF NOT EXISTS exercice02;
CREATE TABLE exercice02.livre(
        id INT GENERATED ALWAYS AS IDENTITY,
        titre VARCHAR(250),
        auteur VARCHAR(250),
        editeur VARCHAR(50),
        date_publication DATE,
        isbn_10 CHAR(10),
        isbn_13 CHAR(14)
);
SELECT * from exercice02.livre ORDER BY date_publication LIMIT 10;
SELECT date_publication,auteur, titre from exercice02.livre ORDER BY date_publication LIMIT 10;
SELECT * from exercice02.livre WHERE auteur LIKE 'Agatha Christie';
UPDATE exercice02.livre SET auteur = 'Agatha Christie' WHERE auteur LIKE 'Agatha%';
SELECT * from exercice02.livre WHERE auteur LIKE 'Agatha Christie';
INSERT INTO exercice02.livre (titre, auteur, editeur, date_publication, isbn_10, isbn_13)
VALUES 
('Poil de Carrottes2','Jules Renard','Livre de Poche','1999-08-25','2253160432','978-2253160435');
DELETE from exercice02.livre  WHERE isbn_10 LIKE '2253160431';


