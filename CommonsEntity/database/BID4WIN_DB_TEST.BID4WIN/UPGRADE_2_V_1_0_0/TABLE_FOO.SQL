-- Cr�ation de la table FOO
CREATE TABLE `FOO`
(
  -- D�finition des champs de la table FOO
  `ID`          int(10)     NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l objet',
  `VERSION`     int(3)      NOT NULL                COMMENT 'Version de l objet',
  `CREATE_DATE` varchar(23) NOT NULL                COMMENT 'Date de creation de l objet',
  `UPDATE_DATE` varchar(23) NOT NULL                COMMENT 'Date de modification de l objet',
  `TYPE`        varchar(20) NOT NULL                COMMENT 'Type de l objet',
  `VALUE`       varchar(20) NOT NULL                COMMENT 'Valeur de l objet',
  `DATE_`       varchar(23) DEFAULT NULL            COMMENT 'Date de l objet',
  `KEY_`        varchar(20) DEFAULT NULL,
  `VALUE2`      varchar(20) DEFAULT NULL,
  `PARENT_ID`   int(10)     DEFAULT NULL            COMMENT 'Identifiant de l objet parent de l objet',
  -- D�finition de la cl� primaire de la table FOO
  PRIMARY KEY (`ID`),
  -- D�finition de la cl� �trang�re de la table FOO vers la table FOO
  KEY `FOO_2_FOO_FK` (`PARENT_ID`),
  CONSTRAINT `FOO_2_FOO_FK` FOREIGN KEY (`PARENT_ID`) REFERENCES `FOO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
