#!/usr/bin/env bash

USERNAME=$1;
PASSWORD=$2;
DB=$3;

# Create MySQL database
mysql -u$USERNAME -p$PASSWORD -e "DROP DATABASE IF EXISTS $DB; CREATE DATABASE $DB;"

# Create PgSQL database
su postgres -c "dropdb $DB --if-exists"
su postgres -c "createdb -O $USERNAME '$DB'"
