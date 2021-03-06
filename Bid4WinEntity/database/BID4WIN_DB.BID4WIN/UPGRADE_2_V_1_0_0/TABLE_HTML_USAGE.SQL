-- Cr�ation de la table HTML_USAGE
CREATE TABLE `HTML_USAGE`
(
  -- D�finition des champs de la table HTML_USAGE
  `ID`           int(10)      NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l utilisation de page HTML',
  `VERSION`      int(3)       NOT NULL                COMMENT 'Version de l utilisation de page HTML',
  `CREATE_DATE`  varchar(23)  NOT NULL                COMMENT 'Date de creation de l utilisation de page HTML',
  `UPDATE_DATE`  varchar(23)  NOT NULL                COMMENT 'Date de modification de l utilisation de page HTML',
  `UPDATE_FORCE` int(3)       NOT NULL                COMMENT 'Champs permettant le forcage de la modification de l utilisation de page HTML',
  `POSITION`     int(3)       DEFAULT 0               COMMENT 'Position de l utilisation de page HTML',
  `PATH`         varchar(150) NOT NULL                COMMENT 'Emplacement de stockage de l utilisation de page HTML',
  `NAME`         varchar(50)  NOT NULL                COMMENT 'Nom de l utilisation de page HTML',
  `FULL_PATH`    varchar(250) NOT NULL                COMMENT 'Chemin complet d acces a l utilisation de page HTML',
  `LANGUAGES`    varchar(30)  NOT NULL                COMMENT 'Langues de l utilisation de page HTML',
  `STORAGE_ID`   int(10)      NOT NULL                COMMENT 'Identifiant de la reference de stockage de la page HTML',
  `USAGE_TYPE`   varchar(10)  NOT NULL                COMMENT 'Type de l utilisation de la page HTML',
  `PRODUCT_ID`   varchar(12)  DEFAULT NULL            COMMENT 'Identifiant du produit utilisant potentiellement la page HTML',
  -- D�finition de la cl� primaire de la table HTML_IMAGE_USAGE
  PRIMARY KEY (`ID`),
  -- D�finition de l'unicit� du couple de champs PATH/NAME
  CONSTRAINT IMAGE_USAGE_UNIQUE_PATHDEF UNIQUE (`PATH`, `NAME`),
  -- D�finition de l'unicit� du champ FULL_PATH
  CONSTRAINT IMAGE_USAGE_UNIQUE_FULLPATH UNIQUE (`FULL_PATH`),
  -- D�finition de la cl� �trang�re de la table HTML_USAGE vers la table HTML_STORAGE
  KEY `HTML_USAGE_2_HTML_STORAGE_FK` (`STORAGE_ID`),
  CONSTRAINT `HTML_USAGE_2_HTML_STORAGE_FK` FOREIGN KEY (`STORAGE_ID`) REFERENCES `HTML_STORAGE` (`ID`),
  -- D�finition de la cl� �trang�re de la table HTML_USAGE vers la table PRODUCT
  KEY `HTML_USAGE_2_PRODUCT_FK` (`PRODUCT_ID`),
  CONSTRAINT `HTML_USAGE_2_PRODUCT_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='Table des utilisations de page HTML';
