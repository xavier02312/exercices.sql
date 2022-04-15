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

/*Ajouter un clée primaire*/
/*Modification de la table SQL "client"*/
ALTER TABLE client ADD id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ADD banque_id INT NOT NULL,ADD FOREIGN KEY (banque_id) REFERENCES banque(id);

/*Cannot add or update a child row: a foreign key constrain fail*/
/*Erreur de clées*/

/*Jointures SQL INNER JOIN REJOINDRE LA TABLE ON = WHERE*/
SELECT banque.id, banque.nom, banque.adresse FROM banque INNER JOIN client  ON client.banque_id = banque.id;

/*on fait coincider la donnée de la colone "banque_id" de client avec la colone "id" de "banque"*/
SELECT banque.id, banque.nom, banque.adresse, client.nom, client.banque_id FROM banque INNER JOIN client ON client.banque_id = banque.id;

/*presision*/
SELECT banque.id, banque.nom AS nom_banque, banque.adresse, client.nom AS nom_client, client.banque_id FROM banque INNER JOIN client ON client.banque_id = banque.id;

/*LEFT*/
SELECT banque.id, banque.nom AS nom_banque, banque.adresse, client.nom AS nom_client, client.banque_id FROM banque LEFT JOIN client ON client.banque_id = banque.id;

/*RIGHT*/
SELECT banque.id, banque.nom AS nom_banque, banque.adresse, client.nom AS nom_client, client.banque_id FROM banque RIGHT JOIN client ON client.banque_id = banque.id;

/*FULL JOIN*/
SELECT banque.id, banque.nom AS nom_banque, banque.adresse, client.nom AS nom_client, client.banque_id FROM banque FULL JOIN client ON client.banque_id = banque.id;

/*Trier les résultats client banque*/
SELECT * FROM client INNER JOIN banque ON banque_id = client.banque_id;

SELECT client.id, client.nom, client.date_de_naissance, banque.nom AS nom_banque FROM client INNER JOIN banque ON banque_id = client.banque_id;
/*Ranger par ordre alphabetique*/
SELECT client.id, client.nom, client.date_de_naissance, banque.nom AS nom_banque FROM client INNER JOIN banque ON banque_id = client.banque_id ORDER BY client.nom ASC;

/*Trie par date de naissance*/
SELECT client.id, client.nom, client.date_de_naissance, banque.nom AS nom_banque FROM client INNER JOIN banque ON banque.id = client.banque_id WHERE client.date_de_naissance > "2020/01/01" ORDER BY client.nom ASC;

/*EXERCICE Voiture Garage nvl table*/
/*Lister toutes les voitures ainsi que l’adresse du garage associé.*/
SELECT * FROM voiture INNER JOIN garage ON garage.id_garage = voiture.garage_id; 

/*Lister tous les garages ainsi que les marques des voitures associé.*/
SELECT garage.*,garage.adresse FROM garage INNER JOIN voiture ON garage.id_garage = voiture.garage_id; 
SELECT garage.*,voiture.marque FROM garage INNER JOIN voiture ON garage.id_garage = voiture.garage_id;


/*-- Table des catégories*/
CREATE TABLE categories (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(60)
);

/* Table des articles*/
CREATE TABLE articles (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(70),
    contenu TEXT,
    creer_le DATE
);

/* Tables des commentaires*/
CREATE TABLE commentaires (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    commentaire TEXT,
    ajouter_le DATE,
    article_id INT,
    FOREIGN KEY (article_id) REFERENCES articles(id)
);

/* Tables associatives*/
CREATE TABLE articles_categories (
    article_id INT,
    categorie_id INT,
    FOREIGN KEY (article_id) REFERENCES articles(id),
    FOREIGN KEY (categorie_id) REFERENCES categories(id)
);
/*table assotiative*/
/* table articles_categories*/
INSERT INTO articles_categories (`article_id`,`categorie_id`) VALUES
				(1,1),(2,3),(3,2),(1,2);

/*Table assocatives*/
CREATE TABLE articles_categories ( article_id INT, categorie_id INT, FOREIGN KEY (article_id) REFERENCES article(id), FOREIGN KEY (categorie_id) REFERENCES categorie(id) ); 

/*Lister tous les articles ainsi que les catégories associées. INNER JOIN ...ON*/
SELECT * FROM article INNER JOIN articles_categories ON articles_categories.article_id = article.id INNER JOIN categorie ON categorie.id = articles_categories.categorie_id;

/*Lister tous les articles ainsi que les commentaires associés.*/

SELECT * FROM article INNER JOIN commentaire ON commentaire.article_id = article.id;

/*Lister tous les articles ainsi que les catégories et commentaires associés*/
SELECT * FROM article INNER JOIN commentaire ON commentaire.id_article = article.id ;

/* Lister tous les commentaires et l’ID de l’article associé (Renommer l’ID de l’article en
« articleId » pour l’affichage des résultats, utiliser pour cela un alias).*/
SELECT id,commentaire, ajouter_le, id_article AS articleId FROM commentaire; 

/*Sélectionner le titre, la date de création de l’article et le nom de la catégorie étant reliés à la
catégorie 2.*/
SELECT article.titre, article.creer_le, categorie.nom FROM article INNER JOIN articles_categories ON articles_categories.article_id = article.id INNER JOIN categorie ON categorie.id = articles_categories.categorie_id WHERE categorie.id = 2; 



/*exercice Recette*/
/*Q1*/
SELECT * FROM utilisateur;

/*Afficher les recettes et le nom de la catégorie liée à celle-ci*/
SELECT * FROM recette INNER JOIN categorie ON categorie.id = recette.categorie_id;

/*Afficher les recettes et ses ingrédients avec les quantités*/
SELECT * FROM recette INNER JOIN recette_ingredients ON recette_ingredients.id_recette = recette.id
INNER JOIN ingredient ON ingredient.id = recette_ingredients.id_ingredient;

/*Afficher le nombre d'utilisateurs ayant créé des recettes*/
SELECT COUNT(DISTINCT utilisateur_id) FROM recette;


/*Afficher le nom des recettes créées par des utilisateurs dont la date de création
de leur compte est antérieure au 01 novembre 2021*/
SELECT recette.nom FROM recette INNER JOIN utilisateur ON utilisateur.id = recette.utilisateur_id WHERE utilisateur.date_de_creation < "2021/11/01";
