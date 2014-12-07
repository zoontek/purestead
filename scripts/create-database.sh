#!/usr/bin/env bash

DB=$1;

# Create MySQL database
mysql -uhomestead -psecret -e "DROP DATABASE IF EXISTS $DB; CREATE DATABASE $DB;"

# Create PgSQL database
su postgres -c "dropdb $DB --if-exists"
su postgres -c "createdb -O homestead '$DB'"
