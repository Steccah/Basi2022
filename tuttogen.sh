#!/bin/sh
echo 'rimuovo tutto.sql'
rm tutto.sql
echo 'creo tutto.sql'
cat *.sql > tutto.sql
