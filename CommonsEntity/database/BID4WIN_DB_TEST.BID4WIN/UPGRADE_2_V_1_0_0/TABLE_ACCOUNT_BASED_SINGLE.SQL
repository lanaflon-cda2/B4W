-- Cr�ation de la table ACCOUNT_BASED_SINGLE
CREATE TABLE `ACCOUNT_BASED_SINGLE`
(
  -- D�finition des champs de la table ACCOUNT_BASED_SINGLE
  `ID`          int(10)     NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l entite',
  `VERSION`     int(3)      NOT NULL                COMMENT 'Version de l entite',
  `CREATE_DATE` varchar(23) NOT NULL                COMMENT 'Date de creation de l entite',
  `UPDATE_DATE` varchar(23) NOT NULL                COMMENT 'Date de modification de l entite',
  `ACCOUNT_ID`  varchar(12) NOT NULL                COMMENT 'Lien vers le compte utilisateur de l entite',
  -- D�finition de la cl� primaire de la table ACCOUNT_BASED_SINGLE
  PRIMARY KEY (`ID`),
  -- D�finition de l'unicit� de lien vers la table ACCOUNT
  UNIQUE KEY `ACCOUNT_BASED_S_UNIQUE_ACCOUNT_ID` (`ACCOUNT_ID`),
  -- D�finition de la cl� �trang�re de la table ACCOUNT_BASED_SINGLE vers la table ACCOUNT_STUB
  KEY `ACCOUNT_BASED_S_2_ACCOUNT_FK` (`ACCOUNT_ID`),
  CONSTRAINT `ACCOUNT_BASED_S_2_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNT_STUB` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='Table de test';
