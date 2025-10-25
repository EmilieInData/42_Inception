#!/bin/bash
# --> shebang = script need to be execute with bash 

# --> start temporarily the server to init SQL commands
initialize_service()
{
	service mariadb start
	sleep 1
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
}

# --> apply good securities practices
# --> mariadb -e = program + execute, execute this command
initialize_securities()
{
    # --> remove anonymous users
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "DELETE FROM mysql.user WHERE User='';"

    # --> reject remote root login
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

    # --> remove test database & his privileges
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "DROP DATABASE IF EXISTS test;"
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"

    # --> reload privilege tables
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
}

# --> create base & user with env
initialize_database()
{
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';"
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER_NAME}'@'%' WITH GRANT OPTION;"
    mariadb -u root -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
    
    #give access to the database file to the user
    chown -R mysql:mysql /var/lib/mysql/${DB_NAME}
}

initialize_service
initialize_securities
initialize_database
service mariadb stop

# --> execute final CMD (from Dockerfile)
exec "$@"
