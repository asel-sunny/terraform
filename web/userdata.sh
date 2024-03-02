#!/bin/bash
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "Task is done! Please work !" >> /var/www/html/index.html
sudo systemctl restart httpd