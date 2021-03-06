-- Modification de la table PREBOOKED_AUCTION
ALTER TABLE PREBOOKED_AUCTION

ADD STEP       varchar(10) NOT NULL
    COMMENT 'Etape courante de la vente aux encheres avec pre-inscription'
    AFTER EXCHANGE_RATES,
ADD ACCOUNT_ID varchar(12)
    COMMENT 'Compte utilisateur ayant remporte la vente aux encheres avec pre-inscription'
    AFTER UPDATE_DATE,
-- D�finition de la cl� �trang�re de la table PREBOOKED_AUCTION vers la table ACCOUNT
ADD KEY `PREBOOKED_AUCTION_2_ACCOUNT_FK` (`ACCOUNT_ID`),
ADD CONSTRAINT `PREBOOKED_AUCTION_2_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNT` (`ID`);