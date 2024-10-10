#!/usr/bin/env bash

mysql --user=root --password="root" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS kanboard;
    GRANT ALL PRIVILEGES ON \`kanboard%\`.* TO 'xyz'@'%';
EOSQL