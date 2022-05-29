DROP TABLE IF EXISTS "INDIRIZZO" CASCADE;
CREATE TABLE "INDIRIZZO" (
	"ID" serial NOT NULL,
	"Via" varchar(60) NOT NULL,
	"Città" varchar(30) NOT NULL,
	"Cap" varchar(5) NOT NULL,
	"Provincia" varchar(2) NOT NULL,
	"Regione" varchar(21) NOT NULL,
	PRIMARY KEY ("ID")
);
DROP TABLE IF EXISTS "UTENTE" CASCADE;
CREATE TABLE "UTENTE" (
	"ID" serial NOT NULL,
	"Nome" varchar(20) NOT NULL,
	"Cognome" varchar(20) NOT NULL,
	"Email" varchar(35) NOT NULL,
	"Telefono" varchar(10),
	"Password" varchar(64),
	"ID_INDIRIZZO" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID_INDIRIZZO") REFERENCES "INDIRIZZO" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "CODICE SCONTO" CASCADE;
CREATE TABLE "CODICE SCONTO" (
	"Nome" varchar(12) NOT NULL,
	"Valore" money NOT NULL,
	PRIMARY KEY ("Nome")
);
DROP TABLE IF EXISTS "ORDINE" CASCADE;
CREATE TABLE "ORDINE" (
	"NumOrdine" serial NOT NULL,
	"Data" date NOT NULL,
	"ID_UTENTE" integer NOT NULL,
	"ID_INDIRIZZO" integer NOT NULL,
	"Nome_CODICE SCONTO" varchar(12),
	PRIMARY KEY ("NumOrdine"),
	FOREIGN KEY ("ID_UTENTE") REFERENCES "UTENTE" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("ID_INDIRIZZO") REFERENCES "INDIRIZZO" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("Nome_CODICE SCONTO") REFERENCES "CODICE SCONTO" ("Nome") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "GRUPPO TASTIERE" CASCADE;
CREATE TABLE "GRUPPO TASTIERE" (
	"ID" serial NOT NULL,
	"NumOrdine_ORDINE" integer NOT NULL,
	"ID_TASTIERA MECCANICA" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("NumOrdine_ORDINE") REFERENCES "ORDINE" ("NumOrdine") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("ID_TASTIERA MECCANICA") REFERENCES "TASTIERA MECCANICA" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "LAYOUT" CASCADE;
CREATE TABLE "LAYOUT" (
	"ID" serial NOT NULL,
	"Formato" varchar(7) NOT NULL,
	"Size" varchar(4) NOT NULL,
	"N_tasti" smallint NOT NULL,
	PRIMARY KEY ("ID")
);
DROP TABLE IF EXISTS "KEYCAPS" CASCADE;
CREATE TABLE "KEYCAPS" (
	"ID" serial NOT NULL,
	"Materiale" varchar(40) NOT NULL,
	"Designer" varchar(40) NOT NULL,
	"Shine_through" bool NOT NULL,
	"Profilo" varchar(6) NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"ID_LAYOUT" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID_LAYOUT") REFERENCES "LAYOUT" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "PCB" CASCADE;
CREATE TABLE "PCB" (
	"ID" serial NOT NULL,
	"Pin_number" smallint NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Ports" varchar(11) NOT NULL,
	"Hotswappable" bool NOT NULL,
	"Retroilluminazione" bool NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"Capacità_batteria" smallint,
	"ID_LAYOUT" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID_LAYOUT") REFERENCES "LAYOUT" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "SWITCH" CASCADE;
CREATE TABLE "SWITCH" (
	"ID" smallint NOT NULL,
	"Colore" varchar(20),
	"Actuation_force" smallint,
	"Transparenza" bool,
	"Led_facing" varchar(5),
	"Silent" bool,
	"Pin_number" smallint,
	"Manufacturer" varchar(20),
	"Actuation_type" varchar(7),
	"Prezzo" money,
	PRIMARY KEY ("ID")
);
DROP TABLE IF EXISTS "PLATE" CASCADE;
CREATE TABLE "PLATE" (
	"ID" serial NOT NULL,
	"Materiale" varchar(40) NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"ID_LAYOUT" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID_LAYOUT") REFERENCES "LAYOUT" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "CASE" CASCADE;
CREATE TABLE "CASE" (
	"ID" serial NOT NULL,
	"Colore" varchar(20),
	"Materiale" varchar(20) NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"ID_LAYOUT" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID_LAYOUT") REFERENCES "LAYOUT" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "TASTIERA MECCANICA" CASCADE;
CREATE TABLE "TASTIERA MECCANICA" (
	"ID" serial NOT NULL,
	"ID_KEYCAPS" integer NOT NULL,
	"ID_PCB" integer NOT NULL,
	"ID_SWITCH" smallint NOT NULL,
	"ID_PLATE" integer NOT NULL,
	"ID_CASE" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("ID_KEYCAPS") REFERENCES "KEYCAPS" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("ID_CASE") REFERENCES "CASE" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("ID_PCB") REFERENCES "PCB" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("ID_PLATE") REFERENCES "PLATE" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY ("ID_SWITCH") REFERENCES "SWITCH" ("ID") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE
);
DROP TABLE IF EXISTS "RECENSIONE" CASCADE;
CREATE TABLE "RECENSIONE" (
	"ID" smallint NOT NULL,
	"Valutazione" varchar(1) NOT NULL,
	"Data" date NOT NULL,
	"Testo" varchar(140),
	"NumOrdine_ORDINE" integer NOT NULL,
	PRIMARY KEY ("ID"),
	FOREIGN KEY ("NumOrdine_ORDINE") REFERENCES "ORDINE" ("NumOrdine") MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE,
	UNIQUE ("NumOrdine_ORDINE")
);
