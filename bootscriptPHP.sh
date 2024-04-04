#!/bin/bash

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
echo "SSH OK"
echo "---------------------------------"

echo "---------------------------------"
echo "INSTALANDO APACHE2"
echo "---------------------------------"

sudo apt-get install apache2 -y
sudo ufw allow apache
sudo ufw reload

echo "---------------------------------"
echo "APACHE2 OK"
echo "---------------------------------"

echo "---------------------------------"
echo "INSTALANDO PHP"
echo "---------------------------------"

sudo apt install php -y
sudo apt install php-pdo -y
sudo apt install php-mysql -y

echo "---------------------------------"
echo "PHP OK"
echo "---------------------------------"



echo "---------------------------------"
echo "VINCULANDO GIT NO SERVIDOR"
echo "---------------------------------"

rm /var/www/html/index.html

sudo apt install git
sudo git clone https://github.com/Leo159753/DevOps.git
cd DevOps
sudo cp -R * /var/www/html


echo "---------------------------------"
echo "GIT NO SERVIDOR OK"
echo "---------------------------------"

apt install mysql-client-core-8.0 -y

sudo apt update

echo "---------------------------------"
echo "IP DA MAQUINA"
echo "---------------------------------"

sudo ifconfig

echo "---------------------------------"
echo "SERVDOR PHP PRONTO PARA USO"
echo "---------------------------------"