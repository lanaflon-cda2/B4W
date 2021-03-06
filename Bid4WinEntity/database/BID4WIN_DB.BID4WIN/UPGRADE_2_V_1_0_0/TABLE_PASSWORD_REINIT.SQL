-- Cr�ation de la table PASSWORD_REINIT
CREATE TABLE `PASSWORD_REINIT`
(
  -- D�finition des champs de la table PASSWORD_REINIT
  `ID`          varchar(16) NOT NULL COMMENT 'Identifiant de la re-initialisation de mot de passe',
  `VERSION`     int(1)      NOT NULL COMMENT 'Version de la re-initialisation de mot de passe',
  `CREATE_DATE` varchar(23) NOT NULL COMMENT 'Date de creation de la re-initialisation de mot de passe',
  `UPDATE_DATE` varchar(23) NOT NULL COMMENT 'Date de modification de la re-initialisation de mot de passe',
  `ACCOUNT_ID`  varchar(12) NOT NULL COMMENT 'Identifiant du compte utilisateur de la re-initialisation de mot de passe',
  -- D�finition de la cl� primaire de la table PASSWORD_REINIT
  PRIMARY KEY (`ID`),
  -- D�finition de l'unicit� du champ ACCOUNT_ID
  CONSTRAINT PASSWORD_REINIT_UNIQUE_ACCOUNT_ID UNIQUE (`ACCOUNT_ID`),
  -- D�finition de la cl� �trang�re de la table PASSWORD_REINIT vers la table ACCOUNT
  KEY `PASSWORD_REINIT_2_ACCOUNT_FK` (`ACCOUNT_ID`),
  CONSTRAINT `PASSWORD_REINIT_2_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNT` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='Table des re-initialisations de mot de passe';
