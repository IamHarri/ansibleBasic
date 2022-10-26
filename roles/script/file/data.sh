#!/bin/bash
sudo apt-get install -y firewalld -y
sudo service firewalld start
sudo systemctl enable firewalld
# install mariadb
sudo apt-get install -y mariadb-server
# sudo vi /etc/my.cnf
sudo service mariadb start
sudo systemctl enable mariadb
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload