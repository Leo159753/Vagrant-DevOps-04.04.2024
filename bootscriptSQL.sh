echo "---------------------------------"
echo "ATUALIZANDO SERVIDOR"
echo "---------------------------------"

sudo su
sudo apt-get update
sudo apt-get upgrade -y

echo "---------------------------------"
echo "INSTALANDO SSH"
echo "---------------------------------"

sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo ufw allow ssh
sudo ufw reload

echo "---------------------------------"
echo "INSTALANDO MYSQL"
echo "---------------------------------"

sudo apt install mysql-server -y
sudo systemctl start mysql.service
sudo enable mysql.service

echo "---------------------------------"
echo "CRIANDO BANCO DE DADOS"
echo "---------------------------------"

sudo mysql <<EOF
CREATE USER 'leo'@'localhost' IDENTIFIED BY 'teste';
CREATE USER 'leo2'@'%' IDENTIFIED BY 'teste';
GRANT ALL PRIVILEGES ON *.* TO 'leo'@'localhost' with GRANT option;
GRANT ALL PRIVILEGES ON *.* TO 'leo2'@'%' with GRANT option;
FLUSH PRIVILEGES;
CREATE database dados;
USE dados;
CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    idade VARCHAR(45) NULL,
    PRIMARY KEY (id)
);
EOF

echo "---------------------------------"
echo "HABILITANDO ACESSO REMOTO DO BANCO DE DADOS"
echo "---------------------------------"

#Precisa-se alterar a opção " bind-address = 127.0.0.1 " para " bind-address = 0.0.0.0 "
cat <<EOF > /etc/mysql/mysql.conf.d/mysqld.cnf
#
# The MySQL database server configuration file.
#
# One can use all long options that the program supports.
# Run program with --help to get a list of available options and with
# --print-defaults to see which it would actually understand and use.
#
# For explanations see
# http://dev.mysql.com/doc/mysql/en/server-system-variables.html

# Here is entries for some specific programs
# The following values assume you have at least 32M ram

[mysqld]
#
# * Basic Settings
#
user            = mysql
# pid-file      = /var/run/mysqld/mysqld.pid
# socket        = /var/run/mysqld/mysqld.sock
# port          = 3306
# datadir       = /var/lib/mysql


# If MySQL is running as a replication slave, this should be
# changed. Ref https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_tmpdir
# tmpdir                = /tmp
#
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 0.0.0.0
mysqlx-bind-address     = 127.0.0.1
#
# * Fine Tuning
#
key_buffer_size         = 16M
# max_allowed_packet    = 64M
# thread_stack          = 256K

# thread_cache_size       = -1

# This replaces the startup script and checks MyISAM tables if needed
# the first time they are touched
myisam-recover-options  = BACKUP

# max_connections        = 151

# table_open_cache       = 4000

#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
#
# Log all queries
# Be aware that this log type is a performance killer.
# general_log_file        = /var/log/mysql/query.log
# general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
# slow_query_log                = 1
# slow_query_log_file   = /var/log/mysql/mysql-slow.log
# long_query_time = 2
# log-queries-not-using-indexes
#
# The following can be used as easy to replay backup logs or for replication.
# note: if you are setting up a replication slave, see README.Debian about
#       other settings you may need to change.
# server-id             = 1
# log_bin                       = /var/log/mysql/mysql-bin.log
# binlog_expire_logs_seconds    = 2592000
max_binlog_size   = 100M
# binlog_do_db          = include_database_name
# binlog_ignore_db      = include_database_name
EOF

sudo systemctl restart mysql.service

echo "---------------------------------"
echo "ACESSO REMOTO DO BANCO HABILITADO"
echo "---------------------------------"


sudo apt update

echo "---------------------------------"
echo "IP DA MAQUINA"
echo "---------------------------------"

sudo ifconfig

echo "---------------------------------"
echo "SERVDOR SQL PRONTO"
echo "---------------------------------"