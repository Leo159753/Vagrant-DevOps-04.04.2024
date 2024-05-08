echo "---------------------------------"
echo "ATUALIZANDO SERVIDOR"
echo "---------------------------------"

sudo su
sudo apt-get update

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



sudo apt-get install curl -y
sudo curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

docker pull httpd

docker run -d -p 82:80 --name meu-httpd httpd

sudo ifconfig
  #   apt-get install -y apache2