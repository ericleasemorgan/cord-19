#!/usr/bin/env bash

# sql2db.sh - given a set of SQL file, fill a database

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 16, 2020 - first cut

# configure
DB="./etc/cord.db"
SQL="./sql"
TMP="./tmp"

# make sane
mkdir -p $TMP

echo "BEGIN TRANSACTION;" >  "$TMP/inserts.sql"
find "$SQL" -type f -name "*.sql" -exec cat {} \+ >> "$TMP/inserts.sql"
echo "END TRANSACTION;" >>  "$TMP/inserts.sql"

# do the work and done
cat "$TMP/inserts.sql" | sqlite3 $DB
exit
