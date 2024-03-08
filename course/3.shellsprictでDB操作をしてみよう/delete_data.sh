#!/bin/bash
# delete_data.sh

MYSQL_HOST="custom_mysql_container"
MYSQL_USER="root"
MYSQL_PASS="yourpassword"
MYSQL_DB_NAME="exampledb"
MYSQL_TABLE_NAME="users"

mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASS" -e "
USE $MYSQL_DB_NAME;
DELETE FROM $MYSQL_TABLE_NAME WHERE name='Alice';"