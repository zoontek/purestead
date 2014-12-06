#!/usr/bin/env bash

USERNAME=$1;

# Update MySQL IDs
mysql -uhomestead -psecret -e "UPDATE mysql.user SET User='$USERNAME' WHERE User='homestead'; FLUSH PRIVILEGES;"

# Update PgSQL IDs
sudo -u postgres psql -c "ALTER ROLE homestead RENAME TO $USERNAME"
