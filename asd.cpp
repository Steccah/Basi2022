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
        cout << "Risultati sbagliati: " << PQerrorMessage(conn) << endl;
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
        cout << "Connessione avvenuta correttamente\n\n";
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
        // filtra per layout e pezzo
        "SELECT k.* ,\"Prezzo\", \"Formato\", \"Size\" \
        FROM \"%s\" as k, \"LAYOUT\" as l \
        WHERE l.\"ID\" = %s AND l.\"ID\" = k.\"ID_LAYOUT\" \
        ORDER BY \"Prezzo\" desc;",

        // costo per tastiera
        "SELECT mkb.\"ID\", (p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\")) Totale \
        FROM \"TASTIERA MECCANICA\" AS mkb \
        JOIN \"KEYCAPS\" AS kc ON mkb.\"ID_KEYCAPS\" = kc.\"ID\" \
        JOIN \"PCB\"     AS p  ON mkb.\"ID_PCB\"     = p.\"ID\" \
        JOIN \"CASE\"    AS c  ON mkb.\"ID_CASE\"    = c.\"ID\" \
        JOIN \"PLATE\"   AS pl ON mkb.\"ID_PLATE\"   = pl.\"ID\" \
        JOIN \"SWITCH\"  AS s  ON mkb.\"ID_SWITCH\"  = s.\"ID\" \
        JOIN \"LAYOUT\"  AS l  ON p.\"ID_LAYOUT\" = l.\"ID\";", // il layout serve per il numero di switch

        // soldi spesi per utente
        "SELECT u.\"Nome\", u.\"Cognome\", mkb.\"ID\", sum(p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\") - COALESCE(cs.\"Valore\", 0::money)) as totale \
        from \"UTENTE\" u \
        JOIN \"INDIRIZZO\" i ON u.\"ID_INDIRIZZO\" = i.\"ID\" \
        JOIN \"ORDINE\" o ON o.\"ID_UTENTE\" = u.\"ID\" \
        JOIN \"GRUPPO TASTIERE\" gt ON gt.\"NumOrdine_ORDINE\" = o.\"NumOrdine\" \
        JOIN \"TASTIERA MECCANICA\" mkb ON mkb.\"ID\" = gt.\"ID_TASTIERA MECCANICA\" \
        \
        FULL JOIN \"CODICE SCONTO\" cs ON cs.\"Nome\" = o.\"Nome_CODICE SCONTO\" \
        \
        JOIN \"KEYCAPS\" AS kc ON mkb.\"ID_KEYCAPS\" = kc.\"ID\" \
        JOIN \"PCB\"     AS p  ON mkb.\"ID_PCB\"     = p.\"ID\" \
        JOIN \"CASE\"    AS c  ON mkb.\"ID_CASE\"    = c.\"ID\" \
        JOIN \"PLATE\"   AS pl ON mkb.\"ID_PLATE\"   = pl.\"ID\" \
        JOIN \"SWITCH\"  AS s  ON mkb.\"ID_SWITCH\"  = s.\"ID\" \
        \
        JOIN \"LAYOUT\"  AS l  ON p.\"ID_LAYOUT\" = l.\"ID\" \
        \
        GROUP BY u.\"ID\", mkb.\"ID\" \
        HAVING sum(p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\") - COALESCE(cs.\"Valore\", 0::money)) > %s::money \
        ORDER BY totale desc;",

        // utenti con più di una tastiera
        "SELECT u.\"Nome\", u.\"Cognome\", count(mkb.\"ID\") \"Numero di tastiere\" \
        from \"UTENTE\" u \
        JOIN \"ORDINE\" o ON o.\"ID_UTENTE\" = u.\"ID\" \
        JOIN \"GRUPPO TASTIERE\" gt ON gt.\"NumOrdine_ORDINE\" = o.\"NumOrdine\" \
        JOIN \"TASTIERA MECCANICA\" mkb ON mkb.\"ID\" = gt.\"ID_TASTIERA MECCANICA\" \
        GROUP BY u.\"ID\" \
        HAVING count(mkb.\"ID\")>1",

        // quanti utenti per regione
        "select count(u.\"ID\") \"Numero di utenti\", \"Regione\" \
        from \"UTENTE\" u \
        JOIN \"INDIRIZZO\" i \
        ON u.\"ID_INDIRIZZO\" = i.\"ID\" \
        GROUP BY i.\"Regione\" \
        HAVING count(u.\"ID\") > 5 \
        ORDER BY count(u.\"ID\");",

        // valutazioni ragruppate e la media di spesa
        "select \"Valutazione\", count(r.\"ID\") \"numero recensioni\", round(avg((p.\"Prezzo\" + kc.\"Prezzo\" + c.\"Prezzo\" + pl.\"Prezzo\" + (s.\"Prezzo\" * l.\"N_tasti\") - COALESCE(cs.\"Valore\", 0::money))::numeric), 2) as media \
        from \"RECENSIONE\" as r \
        join \"ORDINE\" o ON o.\"NumOrdine\" = r.\"NumOrdine_ORDINE\" \
        \
        JOIN \"GRUPPO TASTIERE\" gt ON gt.\"NumOrdine_ORDINE\" = o.\"NumOrdine\" \
        JOIN \"TASTIERA MECCANICA\" mkb ON mkb.\"ID\" = gt.\"ID_TASTIERA MECCANICA\" \
        \
        FULL JOIN \"CODICE SCONTO\" cs ON cs.\"Nome\" = o.\"Nome_CODICE SCONTO\" \
        \
        JOIN \"KEYCAPS\" AS kc ON mkb.\"ID_KEYCAPS\" = kc.\"ID\" \
        JOIN \"PCB\"     AS p  ON mkb.\"ID_PCB\"     = p.\"ID\" \
        JOIN \"CASE\"    AS c  ON mkb.\"ID_CASE\"    = c.\"ID\" \
        JOIN \"PLATE\"   AS pl ON mkb.\"ID_PLATE\"   = pl.\"ID\" \
        JOIN \"SWITCH\"  AS s  ON mkb.\"ID_SWITCH\"  = s.\"ID\" \
        \
        JOIN \"LAYOUT\"  AS l  ON p.\"ID_LAYOUT\" = l.\"ID\" \
        group by \"Valutazione\" \
        order by \"Valutazione\" desc;"};

    char c;
    PGresult *res;
    char queryTemp[1500];
    while (true)
    {
        cout << "1. filtra componenti per layout" << endl
             << "2. per vedere il costo di ogni tastiera" << endl
             << "3. per vedere quali utenti hanno speso più di N €" << endl
             << "4. per vedere quali utenti hanno comprato più di una tastiera" << endl
             << "5. per vedere le regioni che abbiano più di 5 utenti" << endl
             << "6. per vedere le valutazioni ragruppate e la media di spesa" << endl
             << "Q. per uscire" << endl;
        cin >> c;
        switch (c)
        {
        case '1':
            char layout[2];
            cout << "1. ISO-IT 60%" << endl
                 << "2. ISO-IT 65%" << endl
                 << "3. ISO-IT TKL" << endl
                 << "4. ISO-IT 100%" << endl
                 << "5. ISO-DE 60%" << endl
                 << "6. ISO-DE 65%" << endl
                 << "7. ISO-DE TKL" << endl
                 << "8. ISO-DE 100%" << endl
                 << "9. ANSI-US 60%" << endl
                 << "10. ANSI-US 65%" << endl
                 << "11. ANSI-US TKL" << endl
                 << "12. ANSI-US 100%" << endl;
            cin >> layout;

            if (atoi(layout) > 12)
                cout << "Numero non valido";

            cout << "1. Keycaps" << endl
                 << "2. PCB" << endl
                 << "3. Case" << endl
                 << "4. Plate" << endl;
            cin >> c;
            switch (c)
            {
            case '1':
                sprintf(queryTemp, query[0], "KEYCAPS", layout);
                break;
            case '2':
                sprintf(queryTemp, query[0], "PCB", layout);
                break;

            case '3':
                sprintf(queryTemp, query[0], "CASE", layout);
                break;

            case '4':
                sprintf(queryTemp, query[0], "PLATE", layout);
                break;

            default:
                cout << "Numero non valido";
                break;
            }

            res = PQexec(conn, queryTemp);
            checkResults(res, conn);
            PQprint(stdout, res, &options);
            break;
        case '2':
            res = PQexec(conn, query[1]);
            checkResults(res, conn);
            PQprint(stdout, res, &options);
            break;
        case '3':
            char spesa[5];
            cout << "inserire spesa" << endl;
            cin >> spesa;
            sprintf(queryTemp, query[2], spesa);

            res = PQexec(conn, queryTemp);
            checkResults(res, conn);
            PQprint(stdout, res, &options);
            break;
        case '4':
            res = PQexec(conn, query[3]);
            checkResults(res, conn);
            PQprint(stdout, res, &options);
            break;
        case '5':
            res = PQexec(conn, query[4]);
            checkResults(res, conn);
            PQprint(stdout, res, &options);
            break;
        case '6':
            res = PQexec(conn, query[5]);
            checkResults(res, conn);
            PQprint(stdout, res, &options);
            break;
            break;
        case 'q':
        case 'Q':
            cout << "Closing...";
            PQfinish(conn);
            return 0;
        default:
            cout << "carattere non ammesso\n";
        }
    }
    // fine in caso di boh
    PQfinish(conn);
    return 0;
}
