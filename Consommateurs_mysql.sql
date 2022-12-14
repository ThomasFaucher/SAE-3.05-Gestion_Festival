CREATE DATABASE IF NOT EXISTS `SANS_TITRE` DEFAULT CHARACTER SET UTF8MB4 COLLATE utf8_general_ci;
USE `SANS_TITRE`;

CREATE TABLE `AUTEUR` (
  `ida` VARCHAR(42),
  `idme` VARCHAR(42),
  PRIMARY KEY (`ida`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `AVOIR` (
  `idc` VARCHAR(42),
  `idregime` VARCHAR(42),
  PRIMARY KEY (`idc`, `idregime`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

/*
CREATE TABLE `CONSOMMATEUR` (
  `idc` VARCHAR(42),
  PRIMARY KEY (`idc`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
*/

CREATE TABLE `CRENEAU` (
  `idcreneau` VARCHAR(42),
  `datedebut` VARCHAR(42),
  `datefin` VARCHAR(42),
  PRIMARY KEY (`idcreneau`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `CRENEAU_REPAS` (
  `idcreneaurepas` VARCHAR(42),
  `datedeb` VARCHAR(42),
  `datefin` VARCHAR(42),
  PRIMARY KEY (`idcreneaurepas`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `EXPOSANT` (
  `ide` VARCHAR(42),
  `numstand` VARCHAR(42),
  PRIMARY KEY (`ide`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `HOTEL` (
  `idhotel` VARCHAR(42),
  `nomhotel` VARCHAR(42),
  `adressehotel` VARCHAR(42),
  `telhotel` VARCHAR(42),
  `mailhotel` VARCHAR(42),
  `capacitehotel` VARCHAR(42),
  PRIMARY KEY (`idhotel`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `INTERVENANT` (
  `idintervenant` VARCHAR(42),
  `arrive` VARCHAR(42),
  `depart` VARCHAR(42),
  `transport` VARCHAR(42),
  `hotel` VARCHAR(42),
  `intervention` VARCHAR(42),
  `idvoy` VARCHAR(42),
  `idhotel` VARCHAR(42),
  `jourl` VARCHAR(42),
  PRIMARY KEY (`idintervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `INTERVENIR` (
  `ida` VARCHAR(42),
  `idcreneau` VARCHAR(42),
  `idinter` VARCHAR(42),
  PRIMARY KEY (`ida`, `idcreneau`, `idinter`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `INTERVENTION` (
  `idinter` VARCHAR(42),
  `nominter` VARCHAR(42),
  PRIMARY KEY (`idinter`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

/*
CREATE TABLE `INVITE` (
  `idinvite` VARCHAR(42),
  PRIMARY KEY (`idinvite`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
*/

CREATE TABLE `IS_A1` (
  `ide` VARCHAR(42),
  `idc` VARCHAR(42),
  `idp isa` VARCHAR(42),
  PRIMARY KEY (`ide`, `idc`, `idp isa`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `IS_A2` (
  `ids` VARCHAR(42),
  `idintervenant` VARCHAR(42),
  `idc isa` VARCHAR(42),
  PRIMARY KEY (`ids`, `idintervenant`, `idc isa`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `IS_A3` (
  `ida` VARCHAR(42),
  `idpresse` VARCHAR(42),
  `idinvite` VARCHAR(42),
  `idintervenant isa` VARCHAR(42),
  PRIMARY KEY (`ida`, `idpresse`, `idinvite`, `idintervenant isa`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `MAISON_EDITION` (
  `idme` VARCHAR(42),
  `nomme` VARCHAR(42),
  `numstand` VARCHAR(42),
  PRIMARY KEY (`idme`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `MANGER` (
  `idrepas` VARCHAR(42),
  `idc` VARCHAR(42),
  PRIMARY KEY (`idrepas`, `idc`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `NAVETTE` (
  `idnavette` VARCHAR(42),
  `capacitenavette` VARCHAR(42),
  PRIMARY KEY (`idnavette`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `PERSONNE` (
  `idp` VARCHAR(42),
  `nomp` VARCHAR(42),
  `prenomp` VARCHAR(42),
  `ddnp` VARCHAR(42),
  `telp` VARCHAR(42),
  `emailp` VARCHAR(42),
  `mdpp` VARCHAR(42),
  `remarques` VARCHAR(42),
  `moyenlocomotion` VARCHAR(42),
  PRIMARY KEY (`idp`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

/*
CREATE TABLE `PRESSE` (
  `idpresse` VARCHAR(42),
  PRIMARY KEY (`idpresse`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
*/

CREATE TABLE `REGIME` (
  `idregime` VARCHAR(42),
  `nomregime` VARCHAR(42),
  PRIMARY KEY (`idregime`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `REPAS` (
  `idrepas` VARCHAR(42),
  `jour` VARCHAR(42),
  `estmidi:_bool` VARCHAR(42),
  `idrest` VARCHAR(42),
  `idcreneaurepas` VARCHAR(42),
  PRIMARY KEY (`idrepas`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `RESTAURANT` (
  `idrest` VARCHAR(42),
  `nomrest` VARCHAR(42),
  PRIMARY KEY (`idrest`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

/*
CREATE TABLE `STAFF` (
  `ids` VARCHAR(42),
  PRIMARY KEY (`ids`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
*/

CREATE TABLE `TRAVAILLER` (
  `idcreneau` VARCHAR(42),
  `ids` VARCHAR(42),
  PRIMARY KEY (`idcreneau`, `ids`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE `VOYAGE` (
  `idvoy` VARCHAR(42),
  `heuredebvoy` VARCHAR(42),
  `dureevoy` VARCHAR(42),
  `idnavette` VARCHAR(42),
  PRIMARY KEY (`idvoy`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

ALTER TABLE `AUTEUR` ADD FOREIGN KEY (`idme`) REFERENCES `MAISON_EDITION` (`idme`);
ALTER TABLE `AVOIR` ADD FOREIGN KEY (`idregime`) REFERENCES `REGIME` (`idregime`);
-- ALTER TABLE `AVOIR` ADD FOREIGN KEY (`idc`) REFERENCES `CONSOMMATEUR` (`idc`);
ALTER TABLE `INTERVENANT` ADD FOREIGN KEY (`idhotel`) REFERENCES `HOTEL` (`idhotel`);
ALTER TABLE `INTERVENANT` ADD FOREIGN KEY (`idvoy`) REFERENCES `VOYAGE` (`idvoy`);
ALTER TABLE `INTERVENIR` ADD FOREIGN KEY (`idinter`) REFERENCES `INTERVENTION` (`idinter`);
ALTER TABLE `INTERVENIR` ADD FOREIGN KEY (`idcreneau`) REFERENCES `CRENEAU` (`idcreneau`);
ALTER TABLE `INTERVENIR` ADD FOREIGN KEY (`ida`) REFERENCES `AUTEUR` (`ida`);
ALTER TABLE `IS_A1` ADD FOREIGN KEY (`idp isa`) REFERENCES `PERSONNE` (`idp`);
-- ALTER TABLE `IS_A1` ADD FOREIGN KEY (`idc`) REFERENCES `CONSOMMATEUR` (`idc`);
ALTER TABLE `IS_A1` ADD FOREIGN KEY (`ide`) REFERENCES `EXPOSANT` (`ide`);
-- ALTER TABLE `IS_A2` ADD FOREIGN KEY (`idc isa`) REFERENCES `CONSOMMATEUR` (`idc`);
ALTER TABLE `IS_A2` ADD FOREIGN KEY (`idintervenant`) REFERENCES `INTERVENANT` (`idintervenant`);
-- ALTER TABLE `IS_A2` ADD FOREIGN KEY (`ids`) REFERENCES `STAFF` (`ids`);
ALTER TABLE `IS_A3` ADD FOREIGN KEY (`idintervenant isa`) REFERENCES `INTERVENANT` (`idintervenant`);
-- ALTER TABLE `IS_A3` ADD FOREIGN KEY (`idinvite`) REFERENCES `INVITE` (`idinvite`);
-- ALTER TABLE `IS_A3` ADD FOREIGN KEY (`idpresse`) REFERENCES `PRESSE` (`idpresse`);
ALTER TABLE `IS_A3` ADD FOREIGN KEY (`ida`) REFERENCES `AUTEUR` (`ida`);
-- ALTER TABLE `MANGER` ADD FOREIGN KEY (`idc`) REFERENCES `CONSOMMATEUR` (`idc`);
ALTER TABLE `MANGER` ADD FOREIGN KEY (`idrepas`) REFERENCES `REPAS` (`idrepas`);
ALTER TABLE `REPAS` ADD FOREIGN KEY (`idcreneaurepas`) REFERENCES `CRENEAU_REPAS` (`idcreneaurepas`);
ALTER TABLE `REPAS` ADD FOREIGN KEY (`idrest`) REFERENCES `RESTAURANT` (`idrest`);
-- ALTER TABLE `TRAVAILLER` ADD FOREIGN KEY (`ids`) REFERENCES `STAFF` (`ids`);
ALTER TABLE `TRAVAILLER` ADD FOREIGN KEY (`idcreneau`) REFERENCES `CRENEAU` (`idcreneau`);
ALTER TABLE `VOYAGE` ADD FOREIGN KEY (`idnavette`) REFERENCES `NAVETTE` (`idnavette`);