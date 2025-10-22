# --> shebang = script need to be execute with bash 
#! /bin/bash

# --> start temporarily the server to init SQL commands
initialize_service()
{
	service mariadb start
	sleep 1
}

# --> apply good securities practices
initialize_securities()
{
	# --> remove anonymous users
	mariadb -e "DELETE FROM mysql.user WHERE User='';"

	# --> reject remote root login
	mariadb -e "DELETE FROM mysql.user WHERE User='roor' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"

	# --> remove test database & his privileges
	mariadb -e "DROP DATABASE IF EXISTS test;"
	mariadb -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"

	# --> reload privilege tables
	mariadb -e "FLUSH PRIVILEGES;"
}
# --> mariadb -e = program + execute, execute this command

# --> create base & user with env
initialize_database()
{
	mariadb -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
	mariadb -e "CREATE USER IF NOT EXISTS '$DATABASE_USER_NAME'@'%' IDENTIFIED BY '$DATABASE_USER_PASSWORD';"
	mariadb -e "GRANT ALL ON $DATABASE_NAME.* TO '&DATABASE_USER_NAME'@'%';"
	mariadb -e "FLUSH PRIVILEGES;"
}

# --> stop the configuration server
initialize_service
initialize_securities
initialize_database
service mariadb stop

# --> execute final CMD (from Dockerfile)
exec "$@"
