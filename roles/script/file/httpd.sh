!#/bin/bash
sudo apt-get install -y apache2 php php-mysql
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload
# sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf
# # start service
# sudo service httpd start
# sudo systemctl enable httpd
sudo service apache2 start