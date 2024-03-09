#!/bin/bash
sudo dnf install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
#sudo chmod 644 /var/www/html/index.html
#sudo echo "<html>\n<html>\n\t<body>\n\t\t<h1> style="color:blue;> "App is running!</h1>\n\t</body>\n</html>" > /var/www/html/index.html
sudo echo "App is running!" > /var/www/html/index.html

sudo systemctl restart httpd