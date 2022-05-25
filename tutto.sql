-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.0-alpha
-- PostgreSQL version: 14.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file.
-- These commands were put in this file only as a convenience.
--
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
-- ddl-end --


-- object: public."UTENTE" | type: TABLE --
-- DROP TABLE IF EXISTS public."UTENTE" CASCADE;
CREATE TABLE public."UTENTE" (
	"ID" serial NOT NULL,
	"Nome" varchar(20) NOT NULL,
	"Cognome" varchar(20) NOT NULL,
	"Email" varchar(35) NOT NULL,
	"Telefono" varchar(10),
	"Password" varchar(64),
	"ID_INDIRIZZO" integer NOT NULL,
	CONSTRAINT "UTENTE_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

--INSERT INTO public."UTENTE" ("ID", "Nome", "Cognome", "Email", "Telefono", "ID_INDIRIZZO") VALUES (E'1', E'Tony', E'Effe', E'tony@swag.com', E'1234567890', E'1');
---- ddl-end --
--INSERT INTO public."UTENTE" ("ID", "Nome", "Cognome", "Email", "Telefono", "ID_INDIRIZZO") VALUES (E'2', E'Sapo', E'Bully', E'sapo@bul.ly', E'2131232131', E'2');
---- ddl-end --
--INSERT INTO public."UTENTE" ("ID", "Nome", "Cognome", "Email", "Telefono", "ID_INDIRIZZO") VALUES (E'3', E'Pietro', E'Pacciani', E'pietro@gmail.com', E'3123123123', E'3');
---- ddl-end --

-- object: public."INDIRIZZO" | type: TABLE --
-- DROP TABLE IF EXISTS public."INDIRIZZO" CASCADE;
CREATE TABLE public."INDIRIZZO" (
	"ID" serial NOT NULL,
	"Via" varchar(60) NOT NULL,
	"Città" varchar(30) NOT NULL,
	"Cap" varchar(5) NOT NULL,
	"Provincia" varchar(2) NOT NULL,
	"Regione" varchar(21) NOT NULL,
	CONSTRAINT "INDIRIZZO_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

--INSERT INTO public."INDIRIZZO" ("ID", "Via", "Città", "Cap", "Provincia", "Regione") VALUES (E'1', E'Via Crucis 12', E'Chioggia', E'69420', E'VE', E'Veneto');
---- ddl-end --
--INSERT INTO public."INDIRIZZO" ("ID", "Via", "Città", "Cap", "Provincia", "Regione") VALUES (E'2', E'Vicolo Corto 9', E'Arzeri', E'31020', E'TV', E'Veneto');
---- ddl-end --
--INSERT INTO public."INDIRIZZO" ("ID", "Via", "Città", "Cap", "Provincia", "Regione") VALUES (E'3', E'Via Roma 258', E'Castellamare di Stabia', E'03009', E'NA', E'Campania');
---- ddl-end --

-- object: public."ORDINE" | type: TABLE --
-- DROP TABLE IF EXISTS public."ORDINE" CASCADE;
CREATE TABLE public."ORDINE" (
	"NumOrdine" serial NOT NULL,
	"Data" date NOT NULL,
	"ID_UTENTE" integer NOT NULL,
	"ID_INDIRIZZO" integer NOT NULL,
	"Name_CODICE SCONTO" varchar(12),
	CONSTRAINT "ORDINE_pk" PRIMARY KEY ("NumOrdine")
);
-- ddl-end --

-- object: public."GRUPPO TASTIERE" | type: TABLE --
-- DROP TABLE IF EXISTS public."GRUPPO TASTIERE" CASCADE;
CREATE TABLE public."GRUPPO TASTIERE" (
	"ID" serial NOT NULL,
	"NumOrdine_ORDINE" integer NOT NULL,
	"ID_TASTIERA MECCANICA" integer NOT NULL,
	CONSTRAINT "GRUPPO TASTIERE_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

-- object: "ORDINE_fk" | type: CONSTRAINT --
-- ALTER TABLE public."GRUPPO TASTIERE" DROP CONSTRAINT IF EXISTS "ORDINE_fk" CASCADE;
ALTER TABLE public."GRUPPO TASTIERE" ADD CONSTRAINT "ORDINE_fk" FOREIGN KEY ("NumOrdine_ORDINE")
REFERENCES public."ORDINE" ("NumOrdine") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."KEYCAPS" | type: TABLE --
-- DROP TABLE IF EXISTS public."KEYCAPS" CASCADE;
CREATE TABLE public."KEYCAPS" (
	"ID" serial NOT NULL,
	"Materiale" varchar(40) NOT NULL,
	"Designer" varchar(40) NOT NULL,
	"Shine_through" bool NOT NULL,
	"Profilo" varchar(6) NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"ID_LAYOUT" integer NOT NULL,
	CONSTRAINT "KEYCAPS_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

--INSERT INTO public."KEYCAPS" ("ID", "Materiale", "Designer", "Shine_through", "Profilo", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES (E'1', E'PBT', E'Vigil Pablo', E'false', E'DSA', E'NicePBT', E'85', E'30', E'2');
-- ddl-end --

-- object: public."LAYOUT" | type: TABLE --
-- DROP TABLE IF EXISTS public."LAYOUT" CASCADE;
CREATE TABLE public."LAYOUT" (
	"ID" serial NOT NULL,
	"Formato" varchar(7) NOT NULL,
	"Size" varchar(4) NOT NULL,
	"N_tasti" smallint NOT NULL,
	CONSTRAINT "LAYOUT_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

----INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'1', E'ISO-IT', E'60', E'68');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'2', E'ISO-IT', E'65', E'67');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'3', E'ISO-IT', E'TKL', E'87');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'4', E'ISO-IT', E'100', E'104');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'5', E'ISO-DE', E'60', E'68');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'6', E'ISO-DE', E'65', E'67');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'7', E'ISO-DE', E'TKL', E'87');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'8', E'ISO-DE', E'100', E'104');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'9', E'ANSI-US', E'60', E'68');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'10', E'ANSI-US', E'65', E'67');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'11', E'ANSI-US', E'TKL', E'87');
---- ddl-end --
--INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES (E'12', E'ANSI-US', E'100', E'104');
---- ddl-end --

-- object: public."TASTIERA MECCANICA" | type: TABLE --
-- DROP TABLE IF EXISTS public."TASTIERA MECCANICA" CASCADE;
CREATE TABLE public."TASTIERA MECCANICA" (
	"ID" serial NOT NULL,
	"ID_KEYCAPS" integer NOT NULL,
	"ID_PCB" integer NOT NULL,
	"ID_SWITCH" smallint NOT NULL,
	"ID_PLATE" integer NOT NULL,
	"ID_CASE" integer NOT NULL,
	CONSTRAINT "MECHANICAL KEYBOARD_pk" PRIMARY KEY ("ID")
);
-- ddl-end --
/*
INSERT INTO public."TASTIERA MECCANICA" ("ID", "ID_KEYCAPS", "ID_PCB", "ID_SWITCH", "ID_PLATE", "ID_CASE") VALUES (E'1', E'1', E'1', E'1', E'1', E'1');
-- ddl-end --*/

-- object: "KEYCAPS_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TASTIERA MECCANICA" DROP CONSTRAINT IF EXISTS "KEYCAPS_fk" CASCADE;
ALTER TABLE public."TASTIERA MECCANICA" ADD CONSTRAINT "KEYCAPS_fk" FOREIGN KEY ("ID_KEYCAPS")
REFERENCES public."KEYCAPS" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."PCB" | type: TABLE --
-- DROP TABLE IF EXISTS public."PCB" CASCADE;
CREATE TABLE public."PCB" (
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
	CONSTRAINT "PCB_pk" PRIMARY KEY ("ID")
);
-- ddl-end --
COMMENT ON COLUMN public."PCB"."Ports" IS E'type-c\nNon so che altro';
-- ddl-end --

--INSERT INTO public."PCB" ("ID", "Pin_number", "Manufacturer", "Ports", "Hotswappable", "Retroilluminazione", "Prezzo", "Quantità", "ID_LAYOUT", "Capacità_batteria") VALUES (E'1', E'3', E'TOFU', E'Type-c', E'false', E'false', E'230', E'100', E'2', DEFAULT);
---- ddl-end --

-- object: "PCB_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TASTIERA MECCANICA" DROP CONSTRAINT IF EXISTS "PCB_fk" CASCADE;
ALTER TABLE public."TASTIERA MECCANICA" ADD CONSTRAINT "PCB_fk" FOREIGN KEY ("ID_PCB")
REFERENCES public."PCB" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."SWITCH" | type: TABLE --
-- DROP TABLE IF EXISTS public."SWITCH" CASCADE;
CREATE TABLE public."SWITCH" (
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
	CONSTRAINT "SWITCH_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

--INSERT INTO public."SWITCH" ("ID", "Colore", "Actuation_force", "Transparenza", "Led_facing", "Silent", "Pin_number", "Manufacturer", "Actuation_type", "Prezzo") VALUES (E'1', E'Yellow', E'60', E'false', E'North', E'true', E'3', E'Cherry mx', E'Linear', E'0.60');
---- ddl-end --

-- object: "SWITCH_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TASTIERA MECCANICA" DROP CONSTRAINT IF EXISTS "SWITCH_fk" CASCADE;
ALTER TABLE public."TASTIERA MECCANICA" ADD CONSTRAINT "SWITCH_fk" FOREIGN KEY ("ID_SWITCH")
REFERENCES public."SWITCH" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."PLATE" | type: TABLE --
-- DROP TABLE IF EXISTS public."PLATE" CASCADE;
CREATE TABLE public."PLATE" (
	"ID" serial NOT NULL,
	"Materiale" varchar(40) NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"ID_LAYOUT" integer NOT NULL,
	CONSTRAINT "PLATE_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

--INSERT INTO public."PLATE" ("ID", "Materiale", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES (E'1', E'Depleted uranium', E'USSR', E'999', E'3', E'2');
---- ddl-end --

-- object: "PLATE_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TASTIERA MECCANICA" DROP CONSTRAINT IF EXISTS "PLATE_fk" CASCADE;
ALTER TABLE public."TASTIERA MECCANICA" ADD CONSTRAINT "PLATE_fk" FOREIGN KEY ("ID_PLATE")
REFERENCES public."PLATE" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."CASE" | type: TABLE --
-- DROP TABLE IF EXISTS public."CASE" CASCADE;
CREATE TABLE public."CASE" (
	"ID" serial NOT NULL,
	"Colore" varchar(20),
	"Materiale" varchar(20) NOT NULL,
	"Manufacturer" varchar(20) NOT NULL,
	"Prezzo" money NOT NULL,
	"Quantità" smallint NOT NULL,
	"ID_LAYOUT" integer NOT NULL,
	CONSTRAINT new_table_pk PRIMARY KEY ("ID")
);
-- ddl-end --

--INSERT INTO public."CASE" ("ID", "Colore", "Materiale", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES (E'1', E'verde', E'piombo', E'acciaierie venete', E'23', E'12', E'1');
-- ddl-end --

-- object: "CASE_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TASTIERA MECCANICA" DROP CONSTRAINT IF EXISTS "CASE_fk" CASCADE;
ALTER TABLE public."TASTIERA MECCANICA" ADD CONSTRAINT "CASE_fk" FOREIGN KEY ("ID_CASE")
REFERENCES public."CASE" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "LAYOUT_fk" | type: CONSTRAINT --
-- ALTER TABLE public."KEYCAPS" DROP CONSTRAINT IF EXISTS "LAYOUT_fk" CASCADE;
ALTER TABLE public."KEYCAPS" ADD CONSTRAINT "LAYOUT_fk" FOREIGN KEY ("ID_LAYOUT")
REFERENCES public."LAYOUT" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "LAYOUT_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PCB" DROP CONSTRAINT IF EXISTS "LAYOUT_fk" CASCADE;
ALTER TABLE public."PCB" ADD CONSTRAINT "LAYOUT_fk" FOREIGN KEY ("ID_LAYOUT")
REFERENCES public."LAYOUT" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "LAYOUT_fk" | type: CONSTRAINT --
-- ALTER TABLE public."CASE" DROP CONSTRAINT IF EXISTS "LAYOUT_fk" CASCADE;
ALTER TABLE public."CASE" ADD CONSTRAINT "LAYOUT_fk" FOREIGN KEY ("ID_LAYOUT")
REFERENCES public."LAYOUT" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "LAYOUT_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PLATE" DROP CONSTRAINT IF EXISTS "LAYOUT_fk" CASCADE;
ALTER TABLE public."PLATE" ADD CONSTRAINT "LAYOUT_fk" FOREIGN KEY ("ID_LAYOUT")
REFERENCES public."LAYOUT" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "INDIRIZZO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."UTENTE" DROP CONSTRAINT IF EXISTS "INDIRIZZO_fk" CASCADE;
ALTER TABLE public."UTENTE" ADD CONSTRAINT "INDIRIZZO_fk" FOREIGN KEY ("ID_INDIRIZZO")
REFERENCES public."INDIRIZZO" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "UTENTE_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ORDINE" DROP CONSTRAINT IF EXISTS "UTENTE_fk" CASCADE;
ALTER TABLE public."ORDINE" ADD CONSTRAINT "UTENTE_fk" FOREIGN KEY ("ID_UTENTE")
REFERENCES public."UTENTE" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "INDIRIZZO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ORDINE" DROP CONSTRAINT IF EXISTS "INDIRIZZO_fk" CASCADE;
ALTER TABLE public."ORDINE" ADD CONSTRAINT "INDIRIZZO_fk" FOREIGN KEY ("ID_INDIRIZZO")
REFERENCES public."INDIRIZZO" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TASTIERA MECCANICA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."GRUPPO TASTIERE" DROP CONSTRAINT IF EXISTS "TASTIERA MECCANICA_fk" CASCADE;
ALTER TABLE public."GRUPPO TASTIERE" ADD CONSTRAINT "TASTIERA MECCANICA_fk" FOREIGN KEY ("ID_TASTIERA MECCANICA")
REFERENCES public."TASTIERA MECCANICA" ("ID") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."CODICE SCONTO" | type: TABLE --
-- DROP TABLE IF EXISTS public."CODICE SCONTO" CASCADE;
CREATE TABLE public."CODICE SCONTO" (
	"Name" varchar(12) NOT NULL,
	"Valore" money NOT NULL,
	CONSTRAINT "CODICE SCONTO_pk" PRIMARY KEY ("Name")
);
-- ddl-end --

-- object: "CODICE SCONTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ORDINE" DROP CONSTRAINT IF EXISTS "CODICE SCONTO_fk" CASCADE;
ALTER TABLE public."ORDINE" ADD CONSTRAINT "CODICE SCONTO_fk" FOREIGN KEY ("Name_CODICE SCONTO")
REFERENCES public."CODICE SCONTO" ("Name") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."RECENSIONE" | type: TABLE --
-- DROP TABLE IF EXISTS public."RECENSIONE" CASCADE;
CREATE TABLE public."RECENSIONE" (
	"ID" smallint NOT NULL,
	"Valutazione" varchar(1) NOT NULL,
	"Data" date NOT NULL,
	"NumOrdine_ORDINE" integer NOT NULL,
	CONSTRAINT "RECENSIONE_pk" PRIMARY KEY ("ID")
);
-- ddl-end --

-- object: "ORDINE_fk" | type: CONSTRAINT --
-- ALTER TABLE public."RECENSIONE" DROP CONSTRAINT IF EXISTS "ORDINE_fk" CASCADE;
ALTER TABLE public."RECENSIONE" ADD CONSTRAINT "ORDINE_fk" FOREIGN KEY ("NumOrdine_ORDINE")
REFERENCES public."ORDINE" ("NumOrdine") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "RECENSIONE_uq" | type: CONSTRAINT --
-- ALTER TABLE public."RECENSIONE" DROP CONSTRAINT IF EXISTS "RECENSIONE_uq" CASCADE;
ALTER TABLE public."RECENSIONE" ADD CONSTRAINT "RECENSIONE_uq" UNIQUE ("NumOrdine_ORDINE");
-- ddl-end --
INSERT INTO public."LAYOUT" ("ID", "Formato", "Size", "N_tasti") VALUES
(E'1', E'ISO-IT', E'60', E'68'),
(E'2', E'ISO-IT', E'65', E'67'),
(E'3', E'ISO-IT', E'TKL', E'87'),
(E'4', E'ISO-IT', E'100', E'104'),
(E'5', E'ISO-DE', E'60', E'68'),
(E'6', E'ISO-DE', E'65', E'67'),
(E'7', E'ISO-DE', E'TKL', E'87'),
(E'8', E'ISO-DE', E'100', E'104'),
(E'9', E'ANSI-US', E'60', E'68'),
(E'10', E'ANSI-US', E'65', E'67'),
(E'11', E'ANSI-US', E'TKL', E'87'),
(E'12', E'ANSI-US', E'100', E'104');
INSERT INTO public."INDIRIZZO" ("ID", "Via", "Città", "Cap", "Provincia", "Regione") VALUES
(1, '58 American Terrace', 'Palermo', '90141', 'PA', 'Sicilia'),
(2, '701 Eastlawn Terrace', 'Genova', '16124', 'GE', 'Liguria'),
(3, '59 Annamark Hill', 'Genova', '16157', 'GE', 'Liguria'),
(4, '62667 Russell Plaza', 'Genova', '16124', 'GE', 'Liguria'),
(5, '6 Basil Circle', 'Perugia', '06124', 'PG', 'Umbria'),
(6, '02 Annamark Center', 'Perugia', '06124', 'PG', 'Umbria'),
(7, '5 Orin Avenue', 'Bologna', '40141', 'BO', 'Emilia-Romagna'),
(8, '7009 Fair Oaks Parkway', 'Catania', '95123', 'CT', 'Sicilia'),
(9, '41309 Algoma Hill', 'Villanova', '29010', 'BO', 'Emilia-Romagna'),
(10, '7 Pierstorff Circle', 'Padova', '35141', 'PD', 'Veneto'),
(11, '85 Lakeland Circle', 'Milano', '20158', 'MI', 'Lombardia'),
(12, '734 Brickson Park Terrace', 'Trieste', '34141', 'TS', 'Friuli-Venezia Giulia'),
(13, '2094 Lighthouse Bay Center', 'Messina', '98146', 'ME', 'Sicilia'),
(14, '509 Fuller Center', 'Mestre', '30175', 'VE', 'Veneto'),
(15, '31 Ridge Oak Trail', 'Firenze', '50136', 'FI', 'Toscana'),
(16, '19 Dixon Way', 'Verona', '37129', 'VR', 'Veneto'),
(17, '327 Rutledge Trail', 'Genova', '16146', 'GE', 'Liguria'),
(18, '01 Jana Crossing', 'Roma', '00141', 'RO', 'Lazio'),
(19, '07 Dapin Road', 'Padova', '35141', 'PD', 'Veneto'),
(20, '7 Jenna Court', 'Roma', '00196', 'RO', 'Lazio'),
(21, '02771 Mallard Hill', 'Napoli', '80129', 'NA', 'Campania'),
(22, '36449 Jackson Drive', 'Reggio Calabria', '89129', 'RC', 'Calabria'),
(23, '60100 La Follette Junction', 'Verona', '37142', 'VR', 'Veneto'),
(24, '5036 Emmet Parkway', 'Genova', '16124', 'GE', 'Liguria'),
(25, '58 Graceland Terrace', 'Torino', '10141', 'TO', 'Piemonte'),
(26, '059 Merry Way', 'Bologna', '40141', 'BO', 'Emilia-Romagna'),
(27, '0934 Superior Way', 'Mestre', '30175', 'VE', 'Veneto'),
(28, '870 Scott Alley', 'Verona', '37142', 'VR', 'Veneto'),
(29, '0 Bluejay Way', 'Roma', '00152', 'RO', 'Lazio'),
(30, '27604 Meadow Vale Junction', 'Napoli', '80141', 'NA', 'Campania'),
(31, '79 Luster Drive', 'Milano', '20158', 'MI', 'Lombardia'),
(32, '0185 Merry Crossing', 'Padova', '35141', 'PD', 'Veneto'),
(33, '681 Laurel Plaza', 'Bologna', '40128', 'BO', 'Emilia-Romagna'),
(34, '6491 Stoughton Court', 'Palermo', '90129', 'PA', 'Sicilia'),
(35, '69 Dennis Pass', 'Verona', '37129', 'VR', 'Veneto'),
(36, '687 Almo Avenue', 'Napoli', '80141', 'NA', 'Campania'),
(37, '4 Kinsman Trail', 'Bergamo', '24129', 'BG', 'Lombardia'),
(38, '71 Melrose Circle', 'Messina', '98146', 'ME', 'Sicilia'),
(39, '423 Carberry Plaza', 'Padova', '35141', 'PD', 'Veneto'),
(40, '645 Kinsman Circle', 'Villanova', '29010', 'BO', 'Emilia-Romagna'),
(41, '0 Arizona Parkway', 'Bologna', '40128', 'BO', 'Emilia-Romagna'),
(42, '7 Crowley Street', 'Messina', '98168', 'ME', 'Sicilia'),
(43, '8611 Hagan Court', 'Brescia', '25129', 'BS', 'Lombardia'),
(44, '821 Luster Trail', 'Messina', '98146', 'ME', 'Sicilia'),
(45, '6 Delaware Junction', 'Torino', '10141', 'TO', 'Piemonte'),
(46, '97 Dovetail Circle', 'Roma', '00128', 'RO', 'Lazio'),
(47, '7 Packers Court', 'Genova', '16157', 'GE', 'Liguria'),
(48, '214 Armistice Alley', 'Trieste', '34141', 'TR', 'Friuli-Venezia Giulia'),
(49, '24 Johnson Crossing', 'Firenze', '50136', 'FI', 'Toscana'),
(50, '56987 South Alley', 'Verona', '37142', 'VE', 'Veneto'),
(51, '5216 Mallard Court', 'Roma', '00141', 'RO', 'Lazio'),
(52, '7815 Sycamore Plaza', 'Milano', '20136', 'MI', 'Lombardia'),
(53, '67 Grim Avenue', 'Salerno', '84135', 'SA', 'Campania'),
(54, '18630 Mcbride Parkway', 'Torino', '10152', 'TO', 'Piemonte'),
(55, '0170 School Place', 'Pescara', '65129', 'PS', 'Abruzzi'),
(56, '928 Brown Circle', 'Palermo', '90129', 'PA', 'Sicilia'),
(57, '7751 Corry Point', 'Roma', '00174', 'RO', 'Lazio'),
(58, '0 Swallow Parkway', 'Napoli', '80129', 'NA', 'Campania'),
(59, '4658 Arrowood Avenue', 'Venezia', '30132', 'VE', 'Veneto'),
(60, '8 8th Trail', 'Messina', '98168', 'ME', 'Sicilia'),
(61, '3 Hazelcrest Plaza', 'Napoli', '80141', 'NA', 'Campania'),
(62, '2 Loftsgordon Lane', 'Livorno', '57124', 'LI', 'Toscana'),
(63, '96469 Hooker Parkway', 'Napoli', '80129', 'NA', 'Campania'),
(64, '3 Hoffman Junction', 'Napoli', '80141', 'NA', 'Campania'),
(65, '57 Union Place', 'Palermo', '90129', 'PA', 'Sicilia'),
(66, '7675 Forest Run Crossing', 'Roma', '00196', 'RO', 'Lazio'),
(67, '268 Manitowish Terrace', 'Torino', '10129', 'TO', 'Piemonte'),
(68, '24 Ridge Oak Hill', 'Roma', '00128', 'RO', 'Lazio'),
(69, '56449 Almo Junction', 'Genova', '16124', 'GE', 'Liguria'),
(70, '45 Mcguire Alley', 'Roma', '00196', 'RO', 'Lazio'),
(71, '709 Loeprich Hill', 'Bologna', '40128', 'BO', 'Emilia-Romagna'),
(72, '32 Tony Court', 'Cagliari', '09124', 'CA', 'Sardegna'),
(73, '7 Sundown Road', 'Ancona', '60129', 'AN', 'Marche'),
(74, '11 Jenna Circle', 'Messina', '98124', 'ME', 'Sicilia'),
(75, '916 Heffernan Park', 'Firenze', '50136', 'FI', 'Toscana'),
(76, '795 Waxwing Center', 'Milano', '20125', 'MI', 'Lombardia'),
(77, '7026 Lerdahl Junction', 'Genova', '16157', 'GE', 'Liguria'),
(78, '67 Grasskamp Hill', 'Padova', '35129', 'PD', 'Veneto'),
(79, '7 Karstens Hill', 'Trieste', '34141', 'TR', 'Friuli-Venezia Giulia'),
(80, '35 Hollow Ridge Road', 'Padova', '35141', 'PD', 'Veneto'),
(81, '49 Chive Circle', 'Padova', '35129', 'PD', 'Veneto'),
(82, '5 Loomis Way', 'Firenze', '50136', 'FI', 'Toscana'),
(83, '2 Sauthoff Park', 'Messina', '98146', 'ME', 'Sicilia'),
(84, '153 Pankratz Crossing', 'Genova', '16146', 'GE', 'Liguria'),
(85, '518 Annamark Place', 'Roma', '00163', 'RO', 'Lazio'),
(86, '4078 Pankratz Road', 'Brescia', '25129', 'BS', 'Lombardia'),
(87, '222 Coleman Terrace', 'Napoli', '80141', 'NA', 'Campania'),
(88, '71 Lake View Pass', 'Trieste', '34129', 'TR', 'Friuli-Venezia Giulia'),
(89, '866 Anhalt Alley', 'Messina', '98135', 'ME', 'Sicilia'),
(90, '03115 Holy Cross Alley', 'Venezia', '30132', 'VE', 'Veneto'),
(91, '7241 Farragut Hill', 'Cagliari', '09124', 'CA', 'Sardegna'),
(92, '105 Novick Junction', 'Brescia', '25129', 'BS', 'Lombardia'),
(93, '6490 Monica Park', 'Bologna', '40128', 'BO', 'Emilia-Romagna'),
(94, '7461 Hudson Terrace', 'Messina', '98124', 'ME', 'Sicilia'),
(95, '7 International Way', 'Trieste', '34141', 'TR', 'Friuli-Venezia Giulia'),
(96, '8 Hudson Trail', 'Mestre', '30175', 'VE', 'Veneto'),
(97, '6886 Orin Terrace', 'Milano', '20158', 'MI', 'Lombardia'),
(98, '9076 Bartelt Hill', 'Bologna', '40128', 'BO', 'Emilia-Romagna'),
(99, '91081 South Park', 'Bologna', '40141', 'BO', 'Emilia-Romagna'),
(100, '45 Loomis Terrace', 'Laspezia', '19139', 'SP', 'Liguria');
insert into public."UTENTE" ("ID", "Nome", "Cognome", "Email", "Telefono", "ID_INDIRIZZO") values
(1, 'Myrna', 'Oram', 'moram0@gov.uk', '2781816201', 1),
(2, 'Nahum', 'Satford', 'nsatford1@harvard.edu', '1277023494', 2),
(3, 'Camille', 'Blastock', 'cblastock2@paypal.com', '3401560975', 3),
(4, 'Yulma', 'De Avenell', 'ydeavenell3@dedecms.com', '4905849313', 4),
(5, 'Margaretta', 'Swanwick', 'mswanwick4@businesswire.com', '6416794528', 5),
(6, 'Flinn', 'Bretherick', 'fbretherick5@yandex.ru', '9106963593', 6),
(7, 'Grete', 'Farragher', 'gfarragher6@drupal.org', '3177721047', 7),
(8, 'Batholomew', 'Havercroft', 'bhavercroft7@biblegateway.com', '6344495545', 8),
(9, 'Mose', 'Daynter', 'mdaynter8@vimeo.com', '3725081124', 9),
(10, 'Cecilla', 'Varren', 'cvarren9@addtoany.com', '1729793756', 10),
(11, 'Klement', 'Candelin', 'kcandelina@uol.com.br', '8913443555', 11),
(12, 'Ivette', 'Spong', 'ispongb@harvard.edu', '4083158515', 12),
(13, 'Verena', 'Deneve', 'vdenevec@auda.org.au', '9362146084', 13),
(14, 'Terri', 'Fearnehough', 'tfearnehoughd@quantcast.com', '5309501071', 14),
(15, 'Quintilla', 'Haddock', 'qhaddocke@github.com', '2083980207', 15),
(16, 'Alisa', 'Leachman', 'aleachmanf@sitemeter.com', '2166011644', 16),
(17, 'Olly', 'Nott', 'onottg@ucsd.edu', '3889785562', 17),
(18, 'Quincy', 'Siflet', 'qsifleth@live.com', '6039594118', 18),
(19, 'Alta', 'Meaker', 'ameakeri@google.ru', '7457065328', 19),
(20, 'Florentia', 'Ickovitz', 'fickovitzj@live.com', '1504452405', 20),
(21, 'Britt', 'Pavinese', 'bpavinesek@fda.gov', '1714525694', 21),
(22, 'Ina', 'Freathy', 'ifreathyl@google.com.br', '9296455504', 22),
(23, 'Farley', 'Heartfield', 'fheartfieldm@infoseek.co.jp', '6683994266', 23),
(24, 'Raddie', 'Beaulieu', 'rbeaulieun@scientificamerican.com', '4553817265', 24),
(25, 'Sharai', 'Lockyear', 'slockyearo@marriott.com', '1113716415', 25),
(26, 'Nata', 'Dozdill', 'ndozdillp@webmd.com', '6367366363', 26),
(27, 'Gaile', 'Huby', 'ghubyq@nps.gov', '4311167620', 27),
(28, 'Isobel', 'Stranio', 'istranior@netvibes.com', '1381515780', 28),
(29, 'Ulysses', 'Ledgard', 'uledgards@imageshack.us', '2299214992', 29),
(30, 'Justinn', 'Workes', 'jworkest@disqus.com', '1381198886', 30),
(31, 'Rahel', 'Sizey', 'rsizeyu@howstuffworks.com', '9094845340', 31),
(32, 'Dory', 'Shmyr', 'dshmyrv@google.cn', '5425419481', 32),
(33, 'Issiah', 'Johnigan', 'ijohniganw@wikia.com', '4696040997', 33),
(34, 'Michele', 'Deerness', 'mdeernessx@bloomberg.com', '7628356442', 34),
(35, 'Carling', 'Magee', 'cmageey@youtube.com', '5343029192', 35),
(36, 'Eden', 'Wilman', 'ewilmanz@mozilla.com', '4023649827', 36),
(37, 'Meyer', 'Frift', 'mfrift10@bluehost.com', '8486722167', 37),
(38, 'Angelique', 'Lewry', 'alewry11@cafepress.com', '3642057868', 38),
(39, 'Latia', 'Chedgey', 'lchedgey12@simplemachines.org', '9223121959', 39),
(40, 'Jorge', 'O''Neil', 'joneil13@unicef.org', '3108310346', 40),
(41, 'Colet', 'Dallman', 'cdallman14@typepad.com', '8601343804', 41),
(42, 'Katie', 'Wanne', 'kwanne15@nhs.uk', '4877126297', 42),
(43, 'Arley', 'Mabbs', 'amabbs16@vistaprint.com', '8956757148', 43),
(44, 'Kev', 'Dolan', 'kdolan17@comcast.net', '9365174420', 44),
(45, 'Anderson', 'Stoffler', 'astoffler18@newyorker.com', '7556187327', 45),
(46, 'Inness', 'Gibben', 'igibben19@reverbnation.com', '7441629401', 46),
(47, 'Jaclin', 'Nekrews', 'jnekrews1a@nps.gov', '9249701744', 47),
(48, 'Nicki', 'Longden', 'nlongden1b@live.com', '6072144127', 48),
(49, 'Devan', 'Playdon', 'dplaydon1c@msn.com', '2982145493', 49),
(50, 'Ariella', 'Franciottoi', 'afranciottoi1d@rediff.com', '2872351528', 50),
(51, 'Edmon', 'Brookhouse', 'ebrookhouse1e@unicef.org', '1854484765', 51),
(52, 'Dotti', 'Romanski', 'dromanski1f@google.com.au', '5948568140', 52),
(53, 'Bryant', 'Hutson', 'bhutson1g@aboutads.info', '9732983354', 53),
(54, 'Vanya', 'Haugeh', 'vhaugeh1h@networksolutions.com', '6203601640', 54),
(55, 'Edna', 'Airth', 'eairth1i@google.co.uk', '7618894910', 55),
(56, 'Bengt', 'Nutley', 'bnutley1j@flavors.me', '9709685688', 56),
(57, 'Adham', 'Pollicott', 'apollicott1k@wordpress.org', '9412893699', 57),
(58, 'Ariel', 'Jaulme', 'ajaulme1l@wisc.edu', '2017186687', 58),
(59, 'Salim', 'Angear', 'sangear1m@ftc.gov', '9129125955', 59),
(60, 'Riobard', 'Mavin', 'rmavin1n@yellowpages.com', '2947046189', 60),
(61, 'Jerrome', 'Crennan', 'jcrennan1o@shareasale.com', '3148989769', 61),
(62, 'Archibald', 'Laval', 'alaval1p@ebay.com', '7854670104', 62),
(63, 'Jobye', 'Bothwell', 'jbothwell1q@arizona.edu', '1581157170', 63),
(64, 'Jone', 'Messingham', 'jmessingham1r@ihg.com', '8987308884', 64),
(65, 'Rancell', 'Lodford', 'rlodford1s@globo.com', '6113178241', 65),
(66, 'Giffard', 'Armall', 'garmall1t@columbia.edu', '2292017358', 66),
(67, 'Kristina', 'Hampshaw', 'khampshaw1u@posterous.com', '2869807482', 67),
(68, 'Leroy', 'Hooke', 'lhooke1v@bravesites.com', '1328877134', 68),
(69, 'Lexi', 'Guittet', 'lguittet1w@illinois.edu', '1501365336', 69),
(70, 'Corbin', 'Horsewood', 'chorsewood1x@amazon.co.jp', '6821509819', 70),
(71, 'Hamilton', 'Lowde', 'hlowde1y@prweb.com', '2278990405', 71),
(72, 'Duky', 'Buttwell', 'dbuttwell1z@chronoengine.com', '8471494656', 72),
(73, 'Randee', 'Pycock', 'rpycock20@surveymonkey.com', '3182448768', 73),
(74, 'Wilfrid', 'Crim', 'wcrim21@unicef.org', '3433530159', 74),
(75, 'Appolonia', 'McGinney', 'amcginney22@slideshare.net', '2959987376', 75),
(76, 'Valdemar', 'Douse', 'vdouse23@walmart.com', '2975520010', 76),
(77, 'Vladamir', 'Piletic', 'vpiletic24@a8.net', '9443273040', 77),
(78, 'Riobard', 'Dunbobin', 'rdunbobin25@theatlantic.com', '5578762549', 78),
(79, 'Gerhard', 'Nosworthy', 'gnosworthy26@parallels.com', '9529659548', 79),
(80, 'Imelda', 'Maybery', 'imaybery27@wiley.com', '3982180243', 80),
(81, 'Chadwick', 'Buchett', 'cbuchett28@bloglovin.com', '2536283552', 81),
(82, 'Alvina', 'Eldrett', 'aeldrett29@miibeian.gov.cn', '3331269476', 82),
(83, 'Gabbie', 'Losseljong', 'glosseljong2a@lycos.com', '5854644857', 83),
(84, 'Iorgos', 'Dun', 'idun2b@statcounter.com', '8514595745', 84),
(85, 'Phil', 'Lingfoot', 'plingfoot2c@nymag.com', '9717430514', 85),
(86, 'Tonie', 'Levens', 'tlevens2d@sciencedirect.com', '4353081207', 86),
(87, 'Maryanna', 'Bremner', 'mbremner2e@blogger.com', '5425685565', 87),
(88, 'Berti', 'Heningham', 'bheningham2f@dropbox.com', '7842874694', 88),
(89, 'Jeremiah', 'Tureville', 'jtureville2g@cdbaby.com', '7828596064', 89),
(90, 'Krista', 'Lowe', 'klowe2h@usda.gov', '2995669680', 90),
(91, 'Carlene', 'Brocklesby', 'cbrocklesby2i@cisco.com', '3559049747', 91),
(92, 'Halimeda', 'Sturge', 'hsturge2j@google.com.au', '5994577928', 92),
(93, 'Aldin', 'Tessyman', 'atessyman2k@ihg.com', '1738192934', 93),
(94, 'Worden', 'Arnowitz', 'warnowitz2l@slate.com', '6496305635', 94),
(95, 'Hanni', 'Musicka', 'hmusicka2m@tuttocitta.it', '1976218675', 95),
(96, 'Pepi', 'Morland', 'pmorland2n@vistaprint.com', '2189847388', 96),
(97, 'Belia', 'Druett', 'bdruett2o@opensource.org', '7844006201', 97),
(98, 'Jacinthe', 'Clausner', 'jclausner2p@techcrunch.com', '2755679547', 98),
(99, 'Angie', 'Sickling', 'asickling2q@columbia.edu', '8383144016', 99),
(100, 'Bibi', 'Goodhew', 'bgoodhew2r@msn.com', '6481017680', 100),
(101, 'Jdavie', 'Hasslocher', 'jhasslocher2s@ucsd.edu', '2206205961', 56),
(102, 'Moore', 'Coughtrey', 'mcoughtrey2t@github.io', '4753812830', 67),
(103, 'Amata', 'Bulmer', 'abulmer2u@wsj.com', '6055300530', 88),
(104, 'Ive', 'Kernermann', 'ikernermann2v@aboutads.info', '8513658284', 34);
INSERT INTO public."KEYCAPS" ("ID", "Materiale", "Designer", "Shine_through", "Profilo", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES
(1, 'PBT', 'qabercromby0', false, 'OEM', 'KAT', 174.94, 503, 9),
(2, 'ABS', 'wdinesen1', true, 'SA', 'Ducky', 200.73, 480, 6),
(3, 'PBT', 'ysnowman2', false, 'CHERRY', 'RAMAWORKS', 196.84, 733, 6),
(4, 'PBT', 'wpetley3', true, 'SA', 'DomyKEY', 54.81, 443, 11),
(5, 'Legno', 'alethcoe4', true, 'SA', 'DomyKEY', 160.27, 443, 10),
(6, 'PBT', 'ahenlon5', true, 'CHERRY', 'KAT', 123.88, 412, 1),
(7, 'PBT', 'kelcott6', false, 'SA', 'GMK', 87.05, 387, 3),
(8, 'PBT', 'rbushe7', false, 'SA', 'RAMAWORKS', 129.75, 559, 10),
(9, 'ABS', 'edenisyuk8', true, 'CHERRY', 'DomyKEY', 224.59, 201, 3),
(10, 'PBT', 'nherrero9', true, 'DSA', 'EnojyPBT', 70.35, 719, 3),
(11, 'ABS', 'hcondiea', true, 'CHERRY', 'NicePBT', 99.69, 510, 5),
(12, 'PBT', 'ksaggsb', true, 'SA', 'Keyreative', 94.9, 617, 8),
(13, 'ABS', 'tantoniakc', true, 'XDA', 'EnojyPBT', 194.35, 511, 5),
(14, 'PBT', 'vvenediktovd', true, 'XDA', 'EnojyPBT', 129.13, 17, 4),
(15, 'ABS', 'esandilande', true, 'XDA', 'TaiHao', 216.86, 763, 3),
(16, 'Alluminio', 'mcuschierif', false, 'SA', 'GMK', 111.31, 671, 7),
(17, 'PBT', 'ssleightholmeg', false, 'DSA', 'Keyreative', 113.81, 528, 3),
(18, 'ABS', 'rwinsomeh', false, 'XDA', 'EnojyPBT', 209.62, 791, 5),
(19, 'ABS', 'nwoakesi', true, 'DSA', 'GMK', 78.04, 425, 12),
(20, 'PBT', 'gfriesj', true, 'CHERRY', 'DomyKEY', 228.82, 416, 8),
(21, 'PBT', 'sdanielssonk', false, 'SA', 'Glorious', 94.57, 307, 10),
(22, 'PBT', 'rhunsworthl', true, 'DSA', 'Ducky', 186.26, 91, 10),
(23, 'Legno', 'vmullingerm', true, 'CHERRY', 'EnojyPBT', 194.25, 624, 6),
(24, 'ABS', 'aiacovon', false, 'SA', 'EnojyPBT', 69.33, 362, 5),
(25, 'ABS', 'whoyso', false, 'SA', 'Ducky', 161.03, 692, 7),
(26, 'Legno', 'ashyresp', true, 'SA', 'DomyKEY', 120.59, 472, 7),
(27, 'ABS', 'bsambalsq', false, 'SA', 'RAMAWORKS', 107.18, 646, 2),
(28, 'ABS', 'nshawr', true, 'DSA', 'RAMAWORKS', 226.95, 339, 10),
(29, 'PBT', 'ymatchells', true, 'DSA', 'KAT', 196.34, 273, 9),
(30, 'ABS', 'cfesbyt', true, 'OEM', 'RAMAWORKS', 154.06, 391, 8),
(31, 'Legno', 'ckitcheru', false, 'XDA', 'Glorious', 175.23, 285, 12),
(32, 'ABS', 'pnelthroppv', true, 'DSA', 'TaiHao', 91.23, 211, 4),
(33, 'PBT', 'dfurtadow', false, 'XDA', 'GMK', 160.27, 670, 12),
(34, 'ABS', 'bclawsonx', true, 'CHERRY', 'Glorious', 199.55, 317, 4),
(35, 'PBT', 'lstonnery', true, 'SA', 'DomyKEY', 178.68, 243, 4),
(36, 'PBT', 'alenouryz', false, 'DSA', 'EnojyPBT', 194.87, 311, 2),
(37, 'Alluminio', 'hruskin10', false, 'DSA', 'Glorious', 238.47, 705, 9),
(38, 'ABS', 'mfandrey11', false, 'XDA', 'NicePBT', 151.7, 400, 2),
(39, 'PBT', 'neakley12', false, 'XDA', 'GMK', 192.18, 259, 2),
(40, 'ABS', 'npott13', true, 'DSA', 'DomyKEY', 65.03, 403, 9),
(41, 'ABS', 'nlambird14', true, 'XDA', 'NicePBT', 220.57, 474, 5),
(42, 'Legno', 'crobarts15', true, 'CHERRY', 'Glorious', 202.91, 232, 11),
(43, 'ABS', 'slippiatt16', false, 'OEM', 'TaiHao', 92.33, 725, 3),
(44, 'Legno', 'agoreisr17', true, 'OEM', 'NicePBT', 103.06, 394, 4),
(45, 'PBT', 'asiely18', true, 'DSA', 'EnojyPBT', 53.3, 687, 10),
(46, 'ABS', 'shuikerby19', false, 'SA', 'Keyreative', 53.07, 201, 5),
(47, 'PBT', 'jluchetti1a', true, 'DSA', 'KAT', 129.07, 527, 4),
(48, 'ABS', 'bivers1b', true, 'DSA', 'Keyreative', 53.37, 454, 9),
(49, 'Alluminio', 'bbodimeade1c', true, 'OEM', 'Keyreative', 56.4, 53, 1),
(50, 'PBT', 'ostelfax1d', true, 'DSA', 'Keyreative', 136.1, 4, 2),
(51, 'PBT', 'wpitblado1e', true, 'CHERRY', 'Keyreative', 70.16, 57, 11),
(52, 'ABS', 'dscola1f', true, 'CHERRY', 'NicePBT', 63.45, 733, 9),
(53, 'ABS', 'gyekel1g', false, 'XDA', 'KAT', 64.9, 527, 11),
(54, 'PBT', 'edecarlo1h', false, 'OEM', 'KAT', 117.91, 589, 12),
(55, 'ABS', 'gshafier1i', true, 'OEM', 'EnojyPBT', 192.88, 378, 12),
(56, 'PBT', 'nsutworth1j', false, 'OEM', 'NicePBT', 170.72, 530, 3),
(57, 'ABS', 'mgrabb1k', true, 'DSA', 'Glorious', 57.6, 243, 5),
(58, 'PBT', 'sgradly1l', false, 'OEM', 'RAMAWORKS', 84.6, 573, 8),
(59, 'ABS', 'phele1m', false, 'DSA', 'Keyreative', 205.17, 18, 10),
(60, 'ABS', 'ddimbylow1n', true, 'CHERRY', 'RAMAWORKS', 62.06, 128, 11),
(61, 'ABS', 'skupis1o', true, 'XDA', 'GMK', 108.6, 215, 10),
(62, 'Legno', 'kfretwell1p', false, 'XDA', 'NicePBT', 144.4, 747, 10),
(63, 'ABS', 'wpetrulis1q', false, 'DSA', 'GMK', 120.86, 443, 1),
(64, 'ABS', 'tmeran1r', true, 'OEM', 'Keyreative', 132.43, 507, 8),
(65, 'ABS', 'ebratty1s', true, 'SA', 'GMK', 147.42, 28, 4),
(66, 'ABS', 'dwilderspoon1t', false, 'CHERRY', 'RAMAWORKS', 228.95, 620, 2),
(67, 'ABS', 'jartinstall1u', true, 'CHERRY', 'Glorious', 136.08, 600, 12),
(68, 'ABS', 'mvarren1v', false, 'XDA', 'DomyKEY', 106.26, 4, 7),
(69, 'PBT', 'mmahy1w', false, 'XDA', 'DomyKEY', 116.28, 300, 12),
(70, 'PBT', 'vgeraghty1x', true, 'CHERRY', 'EnojyPBT', 237.83, 602, 3),
(71, 'PBT', 'ssircombe1y', false, 'DSA', 'NicePBT', 148.69, 443, 8),
(72, 'PBT', 'mmccarroll1z', false, 'DSA', 'NicePBT', 228.5, 151, 8),
(73, 'PBT', 'hwych20', true, 'DSA', 'Keyreative', 202.93, 195, 1),
(74, 'ABS', 'egonthier21', true, 'XDA', 'KAT', 212.43, 696, 2),
(75, 'PBT', 'nhulstrom22', true, 'DSA', 'GMK', 69.82, 361, 12),
(76, 'ABS', 'yfunnell23', true, 'DSA', 'TaiHao', 117.85, 360, 12),
(77, 'PBT', 'smistry24', true, 'XDA', 'DomyKEY', 216.19, 349, 9),
(78, 'PBT', 'cjanc25', false, 'CHERRY', 'TaiHao', 99.33, 689, 1),
(79, 'ABS', 'cramelot26', true, 'DSA', 'GMK', 182.94, 225, 2),
(80, 'PBT', 'nlerhinan27', false, 'SA', 'TaiHao', 103.36, 532, 9),
(81, 'ABS', 'gaspinwall28', true, 'SA', 'Keyreative', 154.64, 148, 10),
(82, 'PBT', 'bbloan29', false, 'XDA', 'Keyreative', 125.12, 320, 8),
(83, 'PBT', 'sknappe2a', false, 'OEM', 'KAT', 69.06, 211, 9),
(84, 'PBT', 'cdeacon2b', false, 'XDA', 'GMK', 165.87, 722, 2),
(85, 'Alluminio', 'htruse2c', true, 'XDA', 'Ducky', 113.74, 69, 12),
(86, 'PBT', 'rblowfelde2d', false, 'SA', 'TaiHao', 238.78, 72, 9),
(87, 'ABS', 'cachromov2e', false, 'CHERRY', 'Glorious', 120.09, 252, 9),
(88, 'PBT', 'lgoudy2f', true, 'DSA', 'Ducky', 231.66, 729, 11),
(89, 'ABS', 'kpittham2g', false, 'SA', 'TaiHao', 153.91, 572, 12),
(90, 'PBT', 'wforsaith2h', true, 'OEM', 'DomyKEY', 109.38, 300, 4),
(91, 'PBT', 'slandman2i', false, 'DSA', 'Ducky', 157.83, 260, 5),
(92, 'ABS', 'ewhightman2j', false, 'DSA', 'Keyreative', 96.31, 795, 8),
(93, 'ABS', 'santonovic2k', false, 'SA', 'TaiHao', 176.57, 92, 7),
(94, 'ABS', 'swestover2l', true, 'CHERRY', 'EnojyPBT', 122.14, 379, 5),
(95, 'PBT', 'londrousek2m', true, 'XDA', 'KAT', 69.25, 746, 3),
(96, 'ABS', 'aannwyl2n', false, 'CHERRY', 'GMK', 51.83, 789, 3),
(97, 'Legno', 'cfoad2o', true, 'SA', 'Ducky', 239.57, 451, 2),
(98, 'PBT', 'schansonne2p', true, 'CHERRY', 'RAMAWORKS', 193.66, 415, 12),
(99, 'ABS', 'dwildes2q', true, 'CHERRY', 'GMK', 91.19, 363, 9),
(100, 'Alluminio', 'esanson2r', true, 'OEM', 'RAMAWORKS', 63.82, 353, 3);
INSERT INTO public."PCB" ("ID", "Pin_number", "Manufacturer", "Ports", "Hotswappable",  "Retroilluminazione", "Prezzo", "Quantità", "Capacità_batteria", "ID_LAYOUT") VALUES
(1, 5, 'Carpe', 'thunderbolt', true, false, 169.3, 108, null, 2),
(2, 3, 'Pizza', 'PS/2', false, true, 353.94, 39, null, 3),
(3, 5, 'Pizza', 'type a', true, true, 313.07, 41, null, 7),
(4, 5, 'Pizza', 'thunderbolt', false, true, 234.04, 124, null, 7),
(5, 3, 'ErgoDox', 'microusb', false, false, 160.22, 32, 1600, 9),
(6, 5, 'Phantom', 'PS/2', true, true, 336.68, 58, 1200, 9),
(7, 5, 'KBDfans', 'PS/2', false, false, 165.35, 103, null, 6),
(8, 3, 'GMMK', 'type c', false, true, 61.68, 125, 1800, 5),
(9, 3, 'KBDfans', 'type c', true, true, 272.49, 130, null, 2),
(10, 3, 'Pizza', 'type c', true, false, 336.4, 74, null, 10),
(11, 3, 'KBDfans', 'microusb', false, true, 281.87, 30, null, 11),
(12, 3, 'Pizza', 'thunderbolt', true, false, 258.25, 14, null, 1),
(13, 3, 'Carpe', 'thunderbolt', true, false, 278.03, 20, null, 1),
(14, 5, 'Phantom', 'type a', false, false, 311.16, 14, null, 3),
(15, 5, 'Planck', 'type a', false, true, 351.87, 110, null, 12),
(16, 5, 'KBDfans', 'thunderbolt', false, true, 328.35, 110, null, 6),
(17, 5, 'GMMK', 'type a', false, true, 352.99, 31, null, 2),
(18, 5, 'MK61', 'thunderbolt', true, true, 119.35, 127, 2000, 6),
(19, 3, 'MK61', 'type c', true, true, 300.94, 120, null, 7),
(20, 5, 'KBDfans', 'type c', true, true, 358.38, 119, null, 9),
(21, 5, 'FaceW', 'PS/2', false, false, 316.32, 82, null, 2),
(22, 5, 'GMMK', 'thunderbolt', false, false, 44.55, 33, 1800, 7),
(23, 5, 'GMMK', 'thunderbolt', false, false, 349.98, 117, null, 4),
(24, 3, 'Phantom', 'microusb', true, true, 102.79, 128, null, 5),
(25, 5, 'ErgoDox', 'PS/2', false, true, 55.67, 52, null, 8),
(26, 5, 'ErgoDox', 'type a', true, true, 219.87, 124, null, 12),
(27, 5, 'Pizza', 'type c', true, false, 271.42, 29, null, 5),
(28, 3, 'GMMK', 'microusb', true, false, 228.36, 108, null, 7),
(29, 3, 'Carpe', 'type c', false, false, 42.73, 34, null, 9),
(30, 3, 'Phantom', 'microusb', true, true, 191.81, 18, null, 10),
(31, 3, 'Carpe', 'microusb', false, true, 211.92, 27, null, 4),
(32, 5, 'MK61', 'type a', true, true, 108.01, 71, null, 7),
(33, 3, 'Carpe', 'type c', false, true, 181.52, 115, null, 7),
(34, 3, 'FaceW', 'thunderbolt', true, false, 129.36, 84, 1600, 8),
(35, 3, 'Carpe', 'microusb', false, true, 315.44, 89, null, 2),
(36, 3, 'KBDfans', 'type a', false, false, 198.89, 18, null, 12),
(37, 3, 'Pizza', 'type c', false, true, 159.96, 118, null, 8),
(38, 3, 'Planck', 'microusb', false, false, 212.54, 111, 600, 1),
(39, 5, 'MK61', 'thunderbolt', false, true, 180.09, 41, null, 10),
(40, 3, 'Phantom', 'PS/2', false, true, 191.71, 123, 2000, 11),
(41, 5, 'Carpe', 'PS/2', false, false, 387.01, 50, 1000, 2),
(42, 5, 'MK61', 'type a', true, true, 187.4, 25, 1300, 5),
(43, 5, 'Pizza', 'type a', true, true, 127.59, 106, null, 4),
(44, 5, 'MK61', 'microusb', false, false, 375.13, 108, null, 5),
(45, 3, 'Carpe', 'thunderbolt', true, false, 192.35, 49, null, 2),
(46, 5, 'Phantom', 'microusb', false, true, 345.13, 77, null, 7),
(47, 5, 'Pizza', 'PS/2', true, false, 360.27, 113, null, 10);
INSERT INTO public."SWITCH" ("ID", "Colore", "Actuation_force", "Transparenza", "Led_facing", "Silent", "Pin_number", "Manufacturer", "Actuation_type", "Prezzo") VALUES
(1, 'yellow', 48, false, 'north', 'false', 5, 'Kono', 'Linear', 0.89),
(2, 'black', 74, false, 'north', 'false', 5, 'JWK', 'Linear', 0.65),
(3, 'black', 29, true, 'south', 'false', 3, 'Tecsee', 'Linear', 0.71),
(4, 'black', 72, true, 'south', 'true', 3, 'Everglide', 'Linear', 0.59),
(5, 'blue', 79, false, 'south', 'false', 5, 'EPOMAKER', 'Clicky', 0.77),
(6, 'yellow', 29, false, 'north', 'false', 5, 'EPOMAKER', 'Linear', 0.63),
(7, 'blue', 71, true, 'south', 'false', 3, 'Cannonkeys', 'Clicky', 0.6),
(8, 'blue', 35, true, 'north', 'false', 3, 'Kono', 'Clicky', 0.28),
(9, 'black', 60, true, 'south', 'true', 3, 'Tecsee', 'Linear', 0.71),
(10, 'yellow', 63, false, 'north', 'false', 5, 'KTT', 'Linear', 0.78),
(11, 'brown', 68, false, 'north', 'false', 3, 'Kailh', 'Tactile', 0.54),
(12, 'blue', 30, false, 'south', 'false', 5, 'Everglide', 'Clicky', 0.61),
(13, 'red', 80, true, 'south', 'true', 3, 'KTT', 'Linear', 0.63),
(14, 'brown', 69, true, 'south', 'false', 3, 'KTT', 'Tactile', 0.57),
(15, 'red', 71, true, 'south', 'false', 3, 'Kailh', 'Linear', 0.3),
(16, 'black', 51, true, 'north', 'false', 5, 'Kono', 'Linear', 0.53),
(17, 'black', 48, true, 'south', 'true', 3, 'Kono', 'Linear', 0.63),
(18, 'silver', 69, true, 'north', 'true', 3, 'Glorious', 'Linear', 0.57),
(19, 'yellow', 69, true, 'north', 'false', 3, 'Tecsee', 'Linear', 0.29),
(20, 'silver', 40, true, 'north', 'true', 3, 'Kailh', 'Linear', 0.54),
(21, 'brown', 74, true, 'north', 'false', 3, 'Kono', 'Tactile', 0.26),
(22, 'silver', 50, true, 'south', 'true', 5, 'KTT', 'Linear', 0.75),
(23, 'brown', 78, false, 'south', 'false', 5, 'KTT', 'Tactile', 0.44),
(24, 'blue', 74, false, 'north', 'false', 3, 'Kailh', 'Clicky', 0.38),
(25, 'red', 64, true, 'south', 'false', 5, 'EPOMAKER', 'Linear', 0.23),
(26, 'brown', 84, false, 'north', 'false', 5, 'Durock', 'Tactile', 0.5),
(27, 'blue', 40, true, 'south', 'false', 3, 'Glorious', 'Clicky', 0.77),
(28, 'silver', 34, false, 'south', 'true', 3, 'AKKO', 'Linear', 0.37),
(29, 'red', 51, false, 'south', 'true', 3, 'gateron', 'Linear', 0.32),
(30, 'blue', 69, false, 'south', 'false', 5, 'Tungsten', 'Clicky', 0.39);
INSERT INTO public."PLATE" ("ID", "Materiale", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES
(1, 'ottone', 'GMMK', 17.19, 35, 1),
(2, 'legno', 'MK', 15.13, 34, 6),
(3, 'legno', 'MK', 11.04, 30, 10),
(4, 'alluminio', 'KBDfans', 18.28, 81, 5),
(5, 'ottone', 'KBDfans', 14.87, 20, 3),
(6, 'ottone', 'GMMK', 10.22, 39, 5),
(7, 'ottone', 'KBDfans', 11.0, 51, 6),
(8, 'legno', 'GMMK', 11.33, 46, 11),
(9, 'legno', 'KBDfans', 14.14, 60, 11),
(10, 'alluminio', 'MK', 14.2, 100, 4),
(11, 'fibra di carbonio', 'GMMK', 19.77, 47, 4),
(12, 'fibra di carbonio', 'GMMK', 10.98, 13, 2),
(13, 'ottone', 'MK', 12.39, 18, 1),
(14, 'ottone', 'Odin', 14.19, 81, 2),
(15, 'alluminio', 'Odin', 15.61, 90, 3),
(16, 'ottone', 'KBDfans', 10.75, 40, 2),
(17, 'alluminio', 'Odin', 15.72, 39, 1),
(18, 'legno', 'Odin', 10.35, 13, 7),
(19, 'alluminio', 'GMMK', 11.54, 11, 3),
(20, 'alluminio', 'MK', 10.12, 34, 4),
(21, 'ottone', 'MK', 14.02, 28, 3),
(22, 'alluminio', 'MK', 18.21, 47, 11),
(23, 'ottone', 'KBDfans', 13.36, 82, 3),
(24, 'alluminio', 'MK', 16.46, 83, 4),
(25, 'fibra di carbonio', 'KBDfans', 12.1, 21, 8),
(26, 'legno', 'KBDfans', 18.06, 79, 8),
(27, 'fibra di carbonio', 'KBDfans', 19.18, 14, 1),
(28, 'alluminio', 'Odin', 18.05, 37, 9),
(29, 'legno', 'GMMK', 19.67, 79, 4),
(30, 'alluminio', 'MK', 13.89, 27, 9),
(31, 'alluminio', 'MK', 10.51, 31, 1);
INSERT INTO public."CASE" ("ID", "Colore", "Materiale", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES
(1, 'Oro', 'plastica', 'KBDfans', 11.4, 44, 1),
(2, 'Rosso carminio', 'alluminio', 'KBDfans', 15.85, 14, 9),
(3, 'Viola', 'plastica', 'KBDfans', 15.67, 21, 11),
(4, 'Blu', 'alluminio', 'KBDfans', 16.56, 83, 11),
(5, 'Oro', 'plastica', 'TEX', 18.76, 40, 10),
(6, 'Marrone', 'plastica', 'KBDfans', 19.19, 84, 6),
(7, 'Verde', 'plastica', 'TEX', 10.7, 72, 11),
(8, 'Verde', 'alluminio', 'TEX', 10.12, 68, 12),
(9, 'Porpora', 'plastica', 'vortex', 13.36, 99, 5),
(10, 'Azzurro', 'alluminio', 'vortex', 13.69, 52, 1),
(11, 'Giallo', 'plastica', 'varmilio', 18.75, 72, 5),
(12, 'Rosa', 'alluminio', 'KBDfans', 18.7, 76, 4),
(13, 'Verde', 'plastica', 'vortex', 13.53, 78, 6),
(14, 'Rosso', 'alluminio', 'TEX', 11.65, 68, 12),
(15, 'Arancione', 'plastica', 'KBDfans', 15.33, 13, 3),
(16, 'Oro', 'plastica', 'TEX', 10.72, 37, 3),
(17, 'Viola', 'plastica', 'KBDfans', 15.67, 18, 1),
(18, 'Rosso', 'alluminio', 'TEX', 17.28, 12, 11),
(19, 'Rosa', 'plastica', 'TEX', 17.78, 35, 5),
(20, 'Oro', 'plastica', 'KBDfans', 18.78, 94, 10),
(21, 'Marrone', 'plastica', 'KBDfans', 18.7, 48, 9),
(22, 'Rosso', 'alluminio', 'varmilio', 12.16, 67, 6),
(23, 'Rosa', 'plastica', 'KBDfans', 11.26, 77, 7),
(24, 'Marrone', 'alluminio', 'vortex', 13.94, 44, 3),
(25, 'Fuchsia', 'alluminio', 'varmilio', 19.25, 29, 11),
(26, 'Oro', 'plastica', 'vortex', 10.37, 40, 9),
(27, 'Viola', 'alluminio', 'TEX', 13.09, 97, 8),
(28, 'Azzurro', 'plastica', 'varmilio', 12.55, 37, 3),
(29, 'Arancione', 'plastica', 'vortex', 18.41, 50, 8),
(30, 'Bianco', 'alluminio', 'TEX', 17.47, 19, 4),
(31, 'Blu', 'plastica', 'varmilio', 16.16, 81, 8),
(32, 'Marrone', 'alluminio', 'vortex', 17.1, 69, 1),
(33, 'Azzurro', 'alluminio', 'varmilio', 12.22, 45, 2),
(34, 'Bianco', 'alluminio', 'varmilio', 17.02, 33, 2);
INSERT INTO public."TASTIERA MECCANICA" ("ID", "ID_KEYCAPS", "ID_PCB", "ID_SWITCH", "ID_PLATE", "ID_CASE") VALUES
-- keycaps, pcb, switch, plate, case
-- layout 11
(1, 60, 40, 23, 22, 4),
(2, 4, 11, 13, 22, 18),
(3, 4, 40, 7, 8, 7),
(4, 88, 11, 9, 9, 25),
(5, 60, 11, 17, 9, 4),
-- mi pare 6
(6, 39, 4, 12, 14, 33),
(7, 27, 21, 23, 14, 33),
(8, 50, 41, 17, 12, 34),
(9, 74, 17, 11, 16, 33),
--7
(10, 16, 22, 9, 18, 23),
--10
(11, 45, 39, 22, 3, 20),
(12, 61, 30, 27, 3, 5),
--2
(13, 27, 41, 9, 12, 34),
(14, 36, 21, 8, 16, 33),
(15, 38, 17, 19, 14, 34),
(16, 79, 9, 27, 16, 33),
(17, 50, 41, 24, 12, 34),
(18, 66, 35, 28, 12, 34),
(19, 84, 45, 29, 14, 34),
--5
(20, 57, 27, 16, 4, 11),
(21, 46, 42, 24, 6, 11),
(22, 94, 27, 22, 6, 19),
--3
(23, 43, 14, 2, 19, 28),
(24, 96, 2, 8, 21, 16),
(25, 9, 2, 15, 23, 24);
INSERT INTO public."CODICE SCONTO" ("Name", "Valore") VALUES
('lxdevnwmxtue', 5),
('lahgiozbepic', 25),
('mvfpjutbgprs', 10);
INSERT INTO public."ORDINE" ("NumOrdine", "Data", "ID_UTENTE", "ID_INDIRIZZO", "Name_CODICE SCONTO") VALUES

(1, '04/05/2022', 67, 67, null),
(2, '02/05/2022', 71, 71, null),
(3, '02/05/2022', 22, 22, null),
(4, '05/05/2022', 70, 70, null),
(5, '01/05/2022', 78, 78, null),
(6, '03/05/2022', 9, 9, null),
(7, '05/05/2022', 57, 57, 'lxdevnwmxtue'),
(8, '07/05/2022', 98, 98, null),
(9, '02/05/2022', 44, 44, null),
(10, '04/05/2022', 97, 97, null),
(11, '05/05/2022', 93, 93, null),
(12, '30/04/2022', 89, 89, null),
(13, '01/05/2022', 58, 58, 'lahgiozbepic'),
(14, '08/05/2022', 37, 37, 'mvfpjutbgprs'),
(15, '04/05/2022', 75, 75, null),
(16, '07/05/2022', 9, 9, null),
(17, '06/05/2022', 83, 83, null),
(18, '06/05/2022', 24, 24, null),
(19, '03/05/2022', 44, 44, null),
(20, '02/05/2022', 28, 28, null);
INSERT INTO public."GRUPPO TASTIERE" ("ID", "NumOrdine_ORDINE", "ID_TASTIERA MECCANICA") VALUES

(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 5, 6),
(7, 6, 7),
(8, 7, 8),
(9, 7, 9),
(10, 8, 10),
(11, 9, 11),
(12, 10, 12),
(13, 11, 13),
(14, 12, 14),
(15, 12, 15),
(16, 13, 16),
(17, 14, 17),
(18, 15, 18),
(19, 16, 19),
(20, 17, 20),
(21, 18, 21),
(22, 19, 22),
(23, 19, 23),
(24, 20, 24);
