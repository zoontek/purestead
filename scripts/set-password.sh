#!/usr/bin/env bash

USERNAME=$1;
PASSWORD=$2;

# Update MySQL IDs
mysql -u$USERNAME -psecret -e "UPDATE mysql.user SET Password=PASSWORD('$PASSWORD') WHERE User='$USERNAME'; FLUSH PRIVILEGES;"

# Update PgSQL IDs
sudo -u postgres psql -c "ALTER ROLE $USERNAME WITH PASSWORD '$PASSWORD'"
