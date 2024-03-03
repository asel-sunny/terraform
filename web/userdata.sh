#!/bin/bash
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "App is running !" >> /var/www/html/index.html
sudo systemctl restart httpd