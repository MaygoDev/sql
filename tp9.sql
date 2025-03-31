DROP DATABASE IF EXISTS e_commerce;
CREATE DATABASE e_commerce;
USE e_commerce;

CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100)
);

CREATE TABLE commande (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_achat DATETIME NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client(id)
);

CREATE TABLE article (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prix FLOAT NOT NULL
);

CREATE TABLE ligne (
    article_id INT NOT NULL,
    commande_id INT NOT NULL,
    nombre INT NOT NULL,
    prix FLOAT NOT NULL,
    PRIMARY KEY (article_id, commande_id),
    FOREIGN KEY (article_id) REFERENCES article(id),
    FOREIGN KEY (commande_id) REFERENCES commande(id)
);

INSERT INTO article (nom, prix) VALUES
('PlayStation 5', 500),
('X box', 350),
('Machine à café', 400),
('PlayStation 3', 100);

INSERT INTO client (prenom, nom) VALUES
('Brad', 'PITT'),	
('George', 'CLONEY'),
('Jean', 'DUJARDIN');

INSERT INTO commande (date_achat, client_id) VALUES
('2024-09-08 10:15:00', 1);

INSERT INTO ligne (article_id, commande_id, nombre, prix) VALUES
(4, 1, 2, 100),
(3, 1, 1, 300),
(2, 1, 1, 350);

SELECT 
    client.prenom,
    client.nom,
    commande.date_achat,
    article.nom,
    ligne.prix,
    ligne.nombre AS nb,
    ligne.prix * ligne.nombre AS total
FROM commande
INNER JOIN ligne ON commande.id = ligne.commande_id
INNER JOIN article ON ligne.article_id = article.id
INNER JOIN client ON client.id = commande.client_id
WHERE commande.id = 1;

SELECT 
    SUM(ligne.prix * ligne.nombre) AS total_ht,
    SUM(ligne.prix * ligne.nombre * 0.2) AS total_tva,
    SUM(ligne.prix * ligne.nombre * 1.2) AS total_ttc
FROM ligne
WHERE commande_id = 1;
