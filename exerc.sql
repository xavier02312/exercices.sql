/*Créer un id unique a 0 + champs*/
CREATE TABLE etudiants (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR (30),
    Prenom VARCHAR (30),
    Sexe VARCHAR (5),
    Ville VARCHAR (30),
    Age INT,
    Arriver_le DATE 
);
/*Inserer les valeur dans le tableaux*/
INSERT INTO etudiants (Nom, Prenom, Sexe, Ville, Age, Arriver_le) VALUES 
					("Talus", "Jean", "Homme", "Bordeaux", 24, "2019/02/02"),
					("Charles", "Sylvie", "Femme", "Auxerre", 23, "2018/11/23"),
                    ("Cerneau", "Mathilde", "Femme", "Agen", 18, "2019/09/12"),
                    ("Antoine", "Marc", "Homme", "Bordeaux", 21, "2019/03/01"),
                    ("Bertrand", "Edmond", "Homme", "Bordeaux", 26, "2017/07/14"),
                    ("Tarzan", "Sylvie","Femme", "Troyes", 24, "2018/05/08"),
                    ("Ben", "Henry", "Homme","Lille", 20, "2017/10/26"),
                    ("Alaplage", "Martine", "Femme", "Troyes", 23, "2019/01/29");
/*Lister tous les étudiants*/
SELECT Nom, Prenom FROM etudiants; 

/*lister les 5 étudiants*/
SELECT * FROM `etudiants` LIMIT 5; 

/*Trier les étudiants par âges du plus ancien au plus jeune*/
SELECT * FROM `etudiants` ORDER BY age DESC; 

/*Metre à jour l'étudiant "Marc Antoine" en modifiant sa ville par "Caen"*/
UPDATE etudiants SET Ville = "Caen" WHERE id = 4;

/*Lister les 3 derniers étudiants*/
SELECT * FROM etudiants ORDER BY id DESC LIMIT 3; /*en partant de la fin*/ 

/*Lister les 2 étudiants les plus jeunes*/
SELECT * FROM etudiants ORDER BY Age ASC LIMIT 2; /*en partant du plus jeune*/

/*Lister les 4 étudiants à partir de la 5ème position*/
SELECT * FROM etudiants LIMIT 5,4; 

/*Supprimer les étudiants venant de « Lille »*/
DELETE FROM etudiants WHERE Ville = "Lille";

/*Afficher la moyenne d’âge des étudiants*/
SELECT AVG(age) FROM etudiants;
/**/                                      /*ou le nom moyenne ecrit*/ 
SELECT AVG(age)AS moyenne FROM etudiants; 

/*Afficher la moyenne d’âge des étudiants de plus de 22 ans.*/
SELECT AVG(age)AS moyenne FROM etudiants WHERE age > 22; 
                                        /* on rajoute WHERE age > 22 */
/*Lister tous les étudiants sans doublons/ on fait une boucle*/
/*SELECT COUNT(Prenom) AS nb_prenom, Prenom FROM etudiants GROUP BY Prenom HAVING COUNT(Prenom) > 1;*/ 
SELECT DISTINCT(Prenom) FROM etudiants;

/*Lister les étudiants (si existant) dont le prénom est : Charles, Martin, Sylvie, Paul.*/
SELECT * FROM etudiants WHERE Prenom = "Charles" OR Prenom = "Martin" OR Prenom = "Sylvie" OR Prenom = "Paul";
/*ou*/
SELECT * FROM etudiants WHERE Prenom IN ("Charles", "Martin", "Sylvie", "Paul"); 

/*Insérer un nouvel étudiant (à vous de choisir) metre (nom,prenom, sexe ville, age, arriver_le)quand un id est déjà créer*/
INSERT INTO etudiants (Nom, Prenom, Sexe, Ville, Age, Arriver_le) VALUES ("Jean", "Bastien","Homme", "Nante", 25, "2020/10/13"); 

/*Lister les étudiants arriver entre le 01/02/2019 et 05/03/2019*/
SELECT * FROM `etudiants` WHERE Arriver_le > "2019/02/01" AND Arriver_le < "2019/03/05";
/*ou*/
SELECT * FROM etudiants WHERE Arriver_le BETWEEN "2019/02/01" AND "2019/03/05";

/*« Sylvie Tarzan » a changé de nom de famille pour « Mercure »*/
UPDATE etudiants SET nom = "Mercure" WHERE id = 6; 

/*Jean Talus n’est plus un étudiant, le supprimer des résultats*/
DELETE FROM etudiants WHERE id = 1; 