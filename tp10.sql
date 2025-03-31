SELECT * FROM `clients` WHERE nom LIKE 'D%'; 

SELECT nom, prenom FROM `clients`; 

SELECT fiches.noFic, fiches.etat, clients.nom, clients.prenom 
FROM fiches 
INNER JOIN clients ON clients.noCli = fiches.noCli 
WHERE clients.cpo LIKE '44%'; 

SELECT * FROM `fiches` WHERE noFic = 1002; 