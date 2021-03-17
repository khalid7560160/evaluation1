------------------------exercice 1---------------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `posts` (
  `pos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);

CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,);


CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);


CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);


CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);


CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);


CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);


CREATE TABLE IF NOT EXISTS `orders_details` (
  `ode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,);


CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, 




----------------------exercice 2----------------------------------------------------------------------------------------------- 
--COLLATE : Vous avez certainement déjà entendu parler de la collation en SQL Server. C’est traduit en français, par « classement ». Ce n’est pas une très bonne traduction, on va vraiment garder le terme américain de « collation ».
--En SQL Server en français, la collation par défaut est French_CI_AS, c’est une collation Windows. Cette collation s’applique aux VARCHAR ou NVARCHAR, pour les recherches et les tris. Le CI de French_CI_AS veut dire Case Insensitive, donc insensible à la casse. AS, ça veut dire Accent Sensitive, donc sensible aux accents. La sensibilité, c’est comment on compare ces chaînes de caractères dans une clause WHERE par exemple, mais aussi lorsqu’on va faire un tri, avec un ORDER BY.
--On peut changer la collation d’une colonne, et même, on peut changer à la volée dans l’instruction SQL, avec une instruction COLLATE, pour forcer pendant la comparaison une autre collation.
--CHARACTER SET

--Le type "unsigned int" s'utilise quand on a besoin de nombres positifs. Le nombre de joueurs dans une partie par exemple. Il est toujours égal à 0 ou à un nombre plus grand que 0.
--En choisissant "unsigned int" plutôt que "int", tu es sûr que ton nombre de joueurs ne sera jamais négatif dans tes calculs.

--La clause, AUTO_INCREMENT, permet à MySQL de générer un entier unique pour tout nouvel enregistrement d'une table. Cette clause ne peut se mettre que sur les champs de type entier, indexé et non nul. Elle est donc souvent utilisée comme clé primaire.
--Il s'agit d'une syntaxe MySQL non standard. Après les crochets qui entourent la liste des colonnes et des index, MySQL autorise les options de table.

--ENGINE spécifie le moteur de stockage à associer à la table. Un moteur de stockage est un plugin spécial qui implémente toutes les fonctionnalités liées à une table: écriture de lignes et d'index, lecture de lignes et d'index, caches, réparation, etc. InnoDB est le moteur de stockage par défaut (sauf si vous changez la variable default_storage_engine ) et c'est celui qui fonctionne le mieux dans la plupart des situations. En outre, c'est le seul moteur de stockage transactionnel fourni avec MySQL (non distribué par des tiers). Ici vous pouvez voir les autres moteurs. MariaDB et Percona Server ont des moteurs supplémentaires.
--DEFAULT CHARSETspécifie le jeu de caractères de la table , dans ce cas UTF8. Notez que, techniquement parlant, il n'existe pas de jeu de caractères de table. Chaque colonne de texte a un jeu de caractères associé, et il peut être différent pour chaque colonne. Le jeu de caractères du tableau est un jeu par défaut: chaque fois que vous ne spécifiez pas de jeu de caractères pour une colonne, le jeu de caractères du tableau s'applique.
--ENGINE peut être utilisé pour obtenir de meilleures performances dans certains cas extrêmes. DEFAULT CHARSET peut être utilisé pour stocker des chaînes dans un jeu de caractères plus petit que UTF8, là encore pour des raisons de performances. mysqldump ajoute cette syntaxe juste pour être sûr que les tables sont recréées toujours sous le même nom, même sur des serveurs avec une configuration étrange. 

--utf8_general_ci = CHARACTER SET
--Ce type d'encodage a un interclassement très simple :
-- Il supprime tous les accents.
-- Il convertit toutes les lettres en majuscule.
--Il va ensuite réaliser le tri.
--Par exemple si on a les lettres ÀÁÅåāă, pour lui toutes ces lettres sont égales à A.

--L'UTF-8 est le moyen le plus largement utilisé pour représenter le texte Unicode dans les pages Web et vous devriez toujours utiliser l'UTF-8 pour créer vos pages Web et vos bases de données. Mais en principe, l'UTF-8 n'est qu'une façon parmi d'autres d'encoder les caractères Unicode.
--countries


--posts 

DROP TABLE IF EXISTS `gescom`;
CREATE TABLE IF NOT EXISTS `gescom` (
  `pos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pos_libelle` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--countries

CREATE TABLE IF NOT EXISTS `countries` (
  `cou_id` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cou_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE KEY `alpha2` (`cou_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--categories 

CREATE TABLE IF NOT EXISTS `categories` (
  `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  `cat_parent_id` int(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `cat_parent_id` (`cat_parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--suppliers 

CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_countries_id` char(2) NOT NULL,
  `sup_address` varchar(150) NOT NULL,
  `sup_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_contact` varchar(100) NOT NULL,
  `sup_phone` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sup_mail` varchar(75) NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `sup_countries_id` (`sup_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--customers 

CREATE TABLE IF NOT EXISTS `customers` (
  `cus_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cus_lastname` varchar(50) NOT NULL,
  `cus_firstname` varchar(50) NOT NULL,
  `cus_address` varchar(150) NOT NULL,
  `cus_zipcode` varchar(5) NOT NULL,
  `cus_city` varchar(50) NOT NULL,
  `cus_countries_id` char(2) NOT NULL,
  `cus_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cus_phone` int(10) UNSIGNED NOT NULL,
  `cus_password` varchar(60) NOT NULL,
  `cus_add_date` datetime NOT NULL,
  `cus_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`cus_id`),
  KEY `ibfk_customers_countries` (`cus_countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--products 


CREATE TABLE IF NOT EXISTS `products` (
  `pro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int(10) UNSIGNED NOT NULL,
  `pro_price` decimal(7,2) NOT NULL,
  `pro_ref` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_ean` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pro_stock` int(5) UNSIGNED NOT NULL,
  `pro_stock_alert` int(5) UNSIGNED NOT NULL,
  `pro_color` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pro_publish` tinyint(1) NOT NULL,
  `pro_sup_id` int(10) UNSIGNED NOT NULL,
  `pro_add_date` datetime NOT NULL,
  `pro_update_date` datetime DEFAULT NULL,
  `pro_picture` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `pro_sup_id` (`pro_sup_id`) USING BTREE,
  KEY `pro_cat_id` (`pro_cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--orders 


CREATE TABLE IF NOT EXISTS `orders` (
  `ord_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord_order_date` date NOT NULL,
  `ord_payment_date` date DEFAULT NULL,
  `ord_ship_date` date DEFAULT NULL,
  `ord_reception_date` date DEFAULT NULL,
  `ord_status` varchar(25) NOT NULL,
  `ord_cus_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `ord_cus_id` (`ord_cus_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--orders_details 


CREATE TABLE IF NOT EXISTS `orders_details` (
  `ode_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ode_unit_price` decimal(7,2) NOT NULL,
  `ode_discount` decimal(4,2) DEFAULT NULL,
  `ode_quantity` int(5) NOT NULL,
  `ode_ord_id` int(10) UNSIGNED NOT NULL,
  `ode_pro_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ode_id`),
  KEY `ode_ord_id` (`ode_ord_id`) USING BTREE,
  KEY `ode_pro_id` (`ode_pro_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--employees 


CREATE TABLE IF NOT EXISTS `employees` (
  `emp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_superior_id` int(10) UNSIGNED DEFAULT NULL,
  `emp_pos_id` int(10) UNSIGNED NOT NULL,
  `emp_lastname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_firstname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_zipcode` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `emp_phone` int(10) UNSIGNED NOT NULL,
  `emp_salary` int(10) UNSIGNED DEFAULT NULL,
  `emp_enter_date` date NOT NULL,
  `emp_gender` char(1) NOT NULL,
  `emp_children` tinyint(2) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `emp_superior_id` (`emp_superior_id`),
  KEY `emp_pos_id` (`emp_pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


------------------------------table du mcd-----------------------------------------------------------

DROP TABLE IF EXISTS `gescom`;
CREATE TABLE IF NOT EXISTS `gescom`


--tva

CREATE TABLE IF NOT EXISTS TVA(
   Id_TVA COUNTER,
   CODE_TVA_ VARCHAR(50),
   TAUX_TVA VARCHAR(50),
   PRIMARY KEY(Id_TVA)
);

--caracteristic 

CREATE TABLE IF NOT EXISTS caracteristic(
   Id_caracteristic COUNTER,
   car_store_ VARCHAR(50),
   car_service VARCHAR(50),
   car_job VARCHAR(50),
   PRIMARY KEY(Id_caracteristic)
);

--suppliers

CREATE TABLEIF NOT EXISTS Suppliers(
   Id_Suppliers COUNTER,
   sup_name VARCHAR(50) NOT NULL,
   sup_contact VARCHAR(50),
   PRIMARY KEY(Id_Suppliers)
);

-- customers

CREATE TABLE IF NOT EXISTS customers(
   Id_customers COUNTER,
   cli_adress VARCHAR(50),
   cli_name VARCHAR(50) NOT NULL,
   cli_first_name VARCHAR(50) NOT NULL,
   cli_contact VARCHAR(50) NOT NULL,
   cli_add_date VARCHAR(50),
   cli_modification_date VARCHAR(50) NOT NULL,
   cli_password VARCHAR(50) NOT NULL,
   PRIMARY KEY(Id_customers)
);


--category

CREATE TABLE IF NOT EXISTS category(
   Id_category COUNTER,
   cat_name VARCHAR(50),
   Id_category_1 INT NOT NULL,
   PRIMARY KEY(Id_category),
   FOREIGN KEY(Id_category_1) REFERENCES category(Id_category)
);


--orders

CREATE TABLE IF NOT EXISTS Orders(
   Id_Orders COUNTER,
   ord_facturation VARCHAR(50) NOT NULL,
   ord_adress_dlv VARCHAR(50),
   ord_date_dlv DATETIME NOT NULL,
   ord_date_fullpayment LOGICAL,
   Id_customers INT NOT NULL,
   PRIMARY KEY(Id_Orders),
   FOREIGN KEY(Id_customers) REFERENCES customers(Id_customers)
);

--employees

CREATE TABLE IF NOT EXISTS Employees(
   Id_Employees COUNTER,
   empl_job VARCHAR(50) NOT NULL,
   emp_store VARCHAR(50) NOT NULL,
   emp_annual_gross_salary VARCHAR(50) NOT NULL,
   emp_seniority VARCHAR(50) NOT NULL,
   emp_commercial VARCHAR(50) NOT NULL,
   emp_gender VARCHAR(50) NOT NULL,
   emp_status VARCHAR(50) NOT NULL,
   emp_child VARCHAR(50),
   emp_service VARCHAR(50) NOT NULL,
   Id_caracteristic INT NOT NULL,
   Id_Employees_1 INT NOT NULL,
   PRIMARY KEY(Id_Employees),
   FOREIGN KEY(Id_caracteristic) REFERENCES caracteristic(Id_caracteristic),
   FOREIGN KEY(Id_Employees_1) REFERENCES Employees(Id_Employees)
);

 --products

CREATE TABLE IF NOT EXISTS Products(
   Id_Produit COUNTER,
   pro_categorie VARCHAR(50) NOT NULL,
   pro_libelle VARCHAR(50),
   unit_price_HT DECIMAL(10,2) NOT NULL,
   prod_intern_reference VARCHAR(50) NOT NULL,
   pro_EANcode VARCHAR(50) NOT NULL,
   pro_description VARCHAR(50) NOT NULL,
   pro_photo VARCHAR(50) NOT NULL,
   pro_color VARCHAR(50),
   pro_alert_stock VARCHAR(50) NOT NULL,
   pro_physical_stock VARCHAR(50),
   pro_vente BIT INT NOT NULL,
   pro_date_add VARCHAR(50),
   pro_modification_date VARCHAR(50),
   Id_TVA INT NOT NULL,
   Id_Suppliers INT NOT NULL,
   PRIMARY KEY(Id_Produit),
   FOREIGN KEY(Id_TVA) REFERENCES TVA(Id_TVA),
   FOREIGN KEY(Id_Suppliers) REFERENCES Suppliers(Id_Suppliers)
);


CREATE TABLEIF NOT EXISTS represented_by(
   Id_Suppliers INT,
   Id_Employees INT,
   PRIMARY KEY(Id_Suppliers, Id_Employees),
   FOREIGN KEY(Id_Suppliers) REFERENCES Suppliers(Id_Suppliers),
   FOREIGN KEY(Id_Employees) REFERENCES Employees(Id_Employees)
);

CREATE TABLE IF NOT EXISTS manipulate(
   Id_Produit INT,
   Id_Employees INT,
   PRIMARY KEY(Id_Produit, Id_Employees),
   FOREIGN KEY(Id_Produit) REFERENCES Products(Id_Produit),
   FOREIGN KEY(Id_Employees) REFERENCES Employees(Id_Employees)
);

CREATE TABLE IF NOT EXISTS belongs(
   Id_Produit INT,
   Id_category INT,
   PRIMARY KEY(Id_Produit, Id_category),
   FOREIGN KEY(Id_Produit) REFERENCES Products(Id_Produit),
   FOREIGN KEY(Id_category) REFERENCES category(Id_category)
);

CREATE TABLEIF NOT EXISTS is_composed_by(
   Id_Produit INT,
   Id_Orders INT,
   Quantity VARCHAR(50),
   discount_ DECIMAL(4,2),
   PRIMARY KEY(Id_Produit, Id_Orders),
   FOREIGN KEY(Id_Produit) REFERENCES Products(Id_Produit),
   FOREIGN KEY(Id_Orders) REFERENCES Orders(Id_Orders)
);

CREATE TABLE IF NOT EXISTS sells(
   Id_customers INT,
   Id_Employees INT,
   PRIMARY KEY(Id_customers, Id_Employees),
   FOREIGN KEY(Id_customers) REFERENCES customers(Id_customers),
   FOREIGN KEY(Id_Employees) REFERENCES Employees(Id_Employees)
);


--------------------------------------exercice 3-----------------------------------------------------------------------
---Insérez les données des tables products, orders_details et countries.
le probleme dans l'importation etait de remplacer par un ;






















-------------------------------------exercice 4----------------------------------------------------------
--Exportez les données de la table orders_details au format CSV.
faut juste selectionner csv avant d'exporter