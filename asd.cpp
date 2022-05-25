#include <cstdio>
#include <iostream>
#include <fstream>
#include "libpq-fe.h"

using namespace std;

#define PG_HOST "127.0.0.1"
#define PG_USER "postgres"
#define PG_DB "new_database"
#define PG_PASS "postgres"
#define PG_PORT 5432

void checkResults(PGresult *res, const PGconn *conn)
{
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        cout << "risultati merda " << PQerrorMessage(conn) << endl;
        PQclear(res);
        exit(1);
    }
}

void tryConn(PGconn *conn = nullptr)
{
    if (PQstatus(conn) != CONNECTION_OK)
    {
        cout << "Errore di connessione " << PQerrorMessage(conn);
        PQfinish(conn);
        exit(1);
    }
    else
        cout << "Connessione avvenuta correttamente\n";
}

int main(int argc, char **argv)
{
    // inizializzazioni
    PQprintOpt options = {0};
    options.header = 1;             /* Ask for column headers            */
    options.align = 1;              /* Pad short columns for alignment   */
    options.fieldSep = (char *)"|"; /* Use a pipe as the field separator */
    PGconn *conn = nullptr;
    char conninfo[250];
    sprintf(conninfo, "user=%s password=%s dbname=%s hostaddr=%s port=%d", PG_USER, PG_PASS, PG_DB, PG_HOST, PG_PORT);
    conn = PQconnectdb(conninfo);
    tryConn(conn);

    const char *query[6] = {
        "SELECT \"Materiale\", \"Designer\", \"Profilo\", \"Manufacturer\", \"Prezzo\", \"Formato\", \"Size\" \
        FROM \"KEYCAPS\" as k, \"LAYOUT\" as l \
        WHERE l.\"ID\" = k.\"ID_LAYOUT\" \
        ORDER BY \"Prezzo\" desc;",

        "SELECT mkb.\"ID\", (p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\")) totale \
        FROM \"TASTIERA MECCANICA\" AS mkb \
        JOIN \"KEYCAPS\" AS kc ON mkb.\"ID_KEYCAPS\" = kc.\"ID\" \
        JOIN \"PCB\"     AS p  ON mkb.\"ID_PCB\"     = p.\"ID\" \
        JOIN \"CASE\"    AS c  ON mkb.\"ID_CASE\"    = c.\"ID\" \
        JOIN \"PLATE\"   AS pl ON mkb.\"ID_PLATE\"   = pl.\"ID\" \
        JOIN \"SWITCH\"  AS s  ON mkb.\"ID_SWITCH\"  = s.\"ID\" \
        JOIN \"LAYOUT\"  AS l  ON p.\"ID_LAYOUT\" = l.\"ID\";",

        "SELECT u.\"Nome\", u.\"Cognome\", mkb.\"ID\", sum(p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\") - COALESCE(cs.\"Valore\", 0::money)) as totale \
        from \"UTENTE\" u \
        JOIN \"INDIRIZZO\" i ON u.\"ID_INDIRIZZO\" = i.\"ID\" \
        JOIN \"ORDINE\" o ON o.\"ID_UTENTE\" = u.\"ID\" \
        JOIN \"GRUPPO TASTIERE\" gt ON gt.\"NumOrdine_ORDINE\" = o.\"NumOrdine\" \
        JOIN \"TASTIERA MECCANICA\" mkb ON mkb.\"ID\" = gt.\"ID_TASTIERA MECCANICA\" \
        \
        FULL JOIN \"CODICE SCONTO\" cs ON cs.\"Name\" = o.\"Name_CODICE SCONTO\" \
        \
        JOIN \"KEYCAPS\" AS kc ON mkb.\"ID_KEYCAPS\" = kc.\"ID\" \
        JOIN \"PCB\"     AS p  ON mkb.\"ID_PCB\"     = p.\"ID\" \
        JOIN \"CASE\"    AS c  ON mkb.\"ID_CASE\"    = c.\"ID\" \
        JOIN \"PLATE\"   AS pl ON mkb.\"ID_PLATE\"   = pl.\"ID\" \
        JOIN \"SWITCH\"  AS s  ON mkb.\"ID_SWITCH\"  = s.\"ID\" \
        GROUP BY u.\"ID\", mkb.\"ID\" \
        HAVING sum(p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\") - COALESCE(cs.\"Valore\", 0::money)) > 500::money \
        ORDER BY totale desc;",

        "drop view if exists piatti_clienti; \
        create view piatti_clienti as \
        select c.mail,po.piatto,sum(quantita) as tot \
        from cliente c, ordine o, piatti_ordinati po \
        where c.mail = o.cliente and o.id = po.ordine \
        group by c.mail,po.piatto; \
        select p1.mail as cliente, p1.tot as n_ordinazioni \
        from piatti_clienti p1 \
        where p1.piatto = '%s' \
        except \
        select p1.mail, p1.tot \
        from piatti_clienti p1, piatti_clienti p2 \
        where p1.mail = p2.mail and p1.tot < p2.tot \
        order by n_ordinazioni desc;",

        "drop view if exists importo_tot_clienti; \
        create view importo_tot_clienti as \
        select c.mail, sum( \
            p.prezzo * po.quantita * coalesce(r.percentualesconto * 0.01, 1) \
        ) as tot \
        from cliente c, ordine o, piatti_ordinati po, piatto p, ristorante r \
        where c.mail = o.cliente and po.ordine = o.id and \
            po.piatto = p.nome and po.ristorante = p.ristorante and \
            p.ristorante = r.id \
        group by c.mail; \
        drop view if exists spese_sped_tot_clienti; \
        create view spese_sped_tot_clienti as \
        select c.mail, coalesce(sum(s.costospedizione), 0) as tot \
        from cliente c, ordine o left join spedizione s on(s.ordine = o.id) \
        where o.cliente = c.mail and c.premium = false \
        group by c.mail; \
        select c.nome, c.cognome, \
            round(i.tot, 2) as importo_pagato, \
            coalesce(s.tot, 0) as tot_spedizione, \
            round(i.tot + coalesce(s.tot, 0), 2) as totale_pagato \
        from cliente c, \
            importo_tot_clienti i left join spese_sped_tot_clienti s \
            on(i.mail = s.mail) \
        where c.mail = i.mail \
        order by totale_pagato desc \
        limit 10;",

        "select r.nome as ristorante, \
        g.oraapertura as orario_di_apertura, g.orachiusura as orario_di_chiusura \
        from ristorante r, giorno g, ( \
            select c.mail, r.id \
            from cliente c, ristorante r \
            except(select ac.cliente, ap.ristorante \
                from allergie_clienti ac, allergie_piatti ap \
        where ac.allergene = ap.allergene) \
                ) as cr \
        where r.id = g.ristorante and g.data = '%s' and \
            g.oraapertura <= '%s' and g.orachiusura >= '%s' and \
            r.id = cr.id and cr.mail = '%s' \
            order by cr.mail, r.id;"};

    // query
    for (size_t i = 0; i <= 1; i++)
    {
        PGresult *res = PQexec(conn, query[i]);
        checkResults(res, conn);
        PQprint(stdout, res, &options);
    }
    // fine
    PQfinish(conn);
    return 0;
}
