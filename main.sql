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

/*INSERT INTO*/ public."CASE" ("ID", "Colore", "Materiale", "Manufacturer", "Prezzo", "Quantità", "ID_LAYOUT") VALUES (E'1', E'verde', E'piombo', E'acciaierie venete', E'23', E'12', E'1');
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
