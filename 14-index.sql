CREATE INDEX index_keycaps ON "KEYCAPS" ("ID", "Prezzo");
CREATE INDEX index_pcb ON "PCB" ("ID", "Prezzo", "ID_LAYOUT");
CREATE INDEX index_switch ON "SWITCH" ("ID", "Prezzo");
CREATE INDEX index_plate ON "PLATE" ("ID", "Prezzo");
CREATE INDEX index_case ON "CASE" ("ID", "Prezzo");
