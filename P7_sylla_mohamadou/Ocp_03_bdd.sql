
CREATE TABLE modePaiement (
                id INT NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE statut (
                id INT NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE fonction (
                id INT NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE article (
                id INT NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                taille SMALLINT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE ingredient (
                id SMALLINT NOT NULL,
                nom_ingredient VARCHAR(100) NOT NULL,
                prix_ttc DECIMAL(3,2) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE ArticleIngredient (
                article_id INT NOT NULL,
                ingredient_id SMALLINT NOT NULL,
                dose SMALLINT NOT NULL,
                PRIMARY KEY (article_id, ingredient_id)
);


CREATE TABLE adresse (
                id INT NOT NULL,
                numero CHAR(10) NOT NULL,
                voie VARCHAR(50) NOT NULL,
                nom_rue VARCHAR(50) NOT NULL,
                ville VARCHAR(50) NOT NULL,
                code_postal CHAR(5) NOT NULL,
                pays VARCHAR(50) NOT NULL,
                point_de_vent_proche INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE pointDeVente (
                id INT NOT NULL,
                nom_pizzeria VARCHAR(100) NOT NULL,
                adresse_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE stock (
                point_de_vente_id INT NOT NULL,
                ingredient_id SMALLINT NOT NULL,
                quantite_dose SMALLINT,
                PRIMARY KEY (point_de_vente_id, ingredient_id)
);


CREATE TABLE acheteur (
                id INT NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                nom VARCHAR(100) NOT NULL,
                sexe CHAR(1) NOT NULL,
                mot_de_passe CHAR NOT NULL,
                tel CHAR(10) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE commandeClient (
                numero INT NOT NULL,
                acheteur_id INT NOT NULL,
                date_commande DATE NOT NULL,
                heure_commande TIME NOT NULL,
                mode_paiement_id INT NOT NULL,
                commande_payee BOOLEAN NOT NULL,
                commande_livree BOOLEAN,
                point_vente_id INT NOT NULL,
                adresse_id INT NOT NULL,
                statut_id INT NOT NULL,
                PRIMARY KEY (numero)
);


CREATE TABLE ligneCommande (
                numero_commande INT NOT NULL,
                article_id INT NOT NULL,
                quantite INT NOT NULL,
                PRIMARY KEY (numero_commande, article_id)
);


CREATE TABLE employe (
                id INT NOT NULL,
                nom VARCHAR(100) NOT NULL,
                fonction_id INT NOT NULL,
                point_de_vente_id INT NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE clienWeb (
                id INT NOT NULL,
                anniversaire DATE NOT NULL,
                email VARCHAR(100) NOT NULL,
                PRIMARY KEY (id)
);


ALTER TABLE commandeClient ADD CONSTRAINT modepaiement_commande_fk
FOREIGN KEY (mode_paiement_id)
REFERENCES modePaiement (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commandeClient ADD CONSTRAINT statut_commandeclient_fk
FOREIGN KEY (statut_id)
REFERENCES statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE employe ADD CONSTRAINT fonction_employe_fk
FOREIGN KEY (fonction_id)
REFERENCES fonction (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ligneCommande ADD CONSTRAINT article_ligne_de_commande_fk
FOREIGN KEY (article_id)
REFERENCES article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ArticleIngredient ADD CONSTRAINT article_articleingredient_fk
FOREIGN KEY (article_id)
REFERENCES article (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ArticleIngredient ADD CONSTRAINT ingredient_articleingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pointDeVente ADD CONSTRAINT adresse_pointdevente_fk
FOREIGN KEY (adresse_id)
REFERENCES adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commandeClient ADD CONSTRAINT adresse_commande_fk
FOREIGN KEY (adresse_id)
REFERENCES adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE employe ADD CONSTRAINT pointdevente_employe_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES pointDeVente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commandeClient ADD CONSTRAINT pointdevente_commande_fk
FOREIGN KEY (point_vente_id)
REFERENCES pointDeVente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock ADD CONSTRAINT pointdevente_stock_fk
FOREIGN KEY (point_de_vente_id)
REFERENCES pointDeVente (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE clienWeb ADD CONSTRAINT acheteur_clienweb_fk
FOREIGN KEY (id)
REFERENCES acheteur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE employe ADD CONSTRAINT acheteur_employe_fk
FOREIGN KEY (id)
REFERENCES acheteur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commandeClient ADD CONSTRAINT acheteur_commande_fk
FOREIGN KEY (acheteur_id)
REFERENCES acheteur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ligneCommande ADD CONSTRAINT commande_ligne_de_commande_fk
FOREIGN KEY (numero_commande)
REFERENCES commandeClient (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
