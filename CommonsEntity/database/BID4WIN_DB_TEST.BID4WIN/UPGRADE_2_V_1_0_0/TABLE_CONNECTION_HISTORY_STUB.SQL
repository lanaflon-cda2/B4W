-- Cr�ation de la table CONNECTION_HISTORY_STUB
CREATE TABLE `CONNECTION_HISTORY_STUB`
(
  -- D�finition des champs de la table CONNECTION_HISTORY_STUB
  `ID`              int(10)     NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la connexion',
  `VERSION`         int(5)      NOT NULL                COMMENT 'Version de la connexion',
  `CREATE_DATE`     varchar(23) NOT NULL                COMMENT 'Date de creation de la connexion',
  `UPDATE_DATE`     varchar(23) NOT NULL                COMMENT 'Date de modification de la connexion',
  `ACCOUNT_ID`      varchar(12) NOT NULL                COMMENT 'Identifiant du compte utilisateur de connexion',
  `REMAMENT`        int(1)      NOT NULL                COMMENT 'Flag indiquant la remanence de la connexion',
  `SESSION_ID`      varchar(32) NOT NULL                COMMENT 'Identifiant de la session liee a la connexion',
  `IP`              varchar(39) NOT NULL                COMMENT 'Adresse IP de connexion',
  `START_DATE`      varchar(23) NOT NULL                COMMENT 'Date de d�but de connexion',
  `REASON`          varchar(12) NOT NULL                COMMENT 'Raison de fin de connexion',
  `REUSE_ATTEMPTED` int(1)      NOT NULL                COMMENT 'Flag si une reutilisation a deja ete tentee',
  -- D�finition de la cl� primaire de la table CONNECTION_HISTORY_STUB
  PRIMARY KEY (`ID`),
  -- D�finition de la cl� �trang�re de la table CONNECTION_HISTORY_STUB vers la table ACCOUNT_STUB
  KEY `CONNECTION_HISTORY_STUB_2_ACCOUNT_FK` (`ACCOUNT_ID`),
  CONSTRAINT `CONNECTION_HISTORY_STUB_2_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNT_STUB` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='Table des historiques de connexion';
