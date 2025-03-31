DROP DATABASE IF EXISTS spa;
CREATE DATABASE spa;
USE spa;

CREATE TABLE chat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    couleur_id INT NULL
);

CREATE TABLE couleur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

ALTER TABLE chat 
ADD CONSTRAINT fk_couleur 
FOREIGN KEY (couleur_id) REFERENCES couleur(id);

INSERT INTO couleur (nom) VALUES
('marron'),
('bleu'),
('vert');

INSERT INTO chat (nom, age, couleur_id) VALUES
('maine coon', 20, 1),
('siamois', 15, 2),
('bengal', 18, 1),
('scottish fold', 10, 1),
('domestique', 21, NULL);

SELECT nom FROM chat;
SELECT nom FROM couleur;

SELECT chat.id, chat.nom, couleur.nom AS yeux, chat.age 
FROM chat
INNER JOIN couleur ON chat.couleur_id = couleur.id;

SELECT chat.id, chat.nom, COALESCE(couleur.nom, 'PAS DE COULEUR') AS yeux, chat.age 
FROM chat
LEFT JOIN couleur ON chat.couleur_id = couleur.id;

SELECT chat.id, chat.nom, chat.age 
FROM chat
WHERE couleur_id IS NULL;

SELECT couleur.nom AS couleur, COUNT(chat.id) AS nb_chat 
FROM couleur
LEFT JOIN chat ON couleur.id = chat.couleur_id
GROUP BY couleur.id;

SELECT AVG(info.nb_chat) AS moyenne_couleur_yeux 
FROM (
    SELECT couleur.nom AS couleur, COUNT(chat.id) AS nb_chat 
    FROM couleur
    LEFT JOIN chat ON couleur.id = chat.couleur_id
    GROUP BY couleur.id
) AS info;
    