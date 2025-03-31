DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
USE zoo;

CREATE TABLE chat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    yeux VARCHAR(20) NOT NULL,
    age INT NOT NULL
);

TRUNCATE chat;

INSERT INTO chat (nom, yeux, age) VALUES
('Maine Coon', 'marron', 20),
('Siamois', 'bleu', 15),
('Bengal', 'marron', 18),
('Scottish Fold', 'marron', 10);

SELECT * FROM chat WHERE id = 2;

SELECT * FROM chat ORDER BY nom, age;

SELECT * FROM chat WHERE age BETWEEN 11 AND 19;

SELECT * FROM chat WHERE nom LIKE '%sia%';

SELECT * FROM chat WHERE nom LIKE '%a%';

SELECT AVG(age) AS age_moyen FROM chat;

SELECT COUNT(*) AS nb_chat FROM chat;

SELECT COUNT(*) AS nb_chat_marron FROM chat WHERE yeux = 'marron';

SELECT * FROM chat ORDER BY age ASC LIMIT 1;

SELECT * FROM chat ORDER BY age DESC LIMIT 1;
