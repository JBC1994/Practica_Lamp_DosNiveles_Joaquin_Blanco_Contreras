echo "Hola soy la maquina con Apache2, vamos a proceder con el script de aprovisionamiento para la instalación de los servicios" 

sudo apt-get -y update
sudo apt-get install -y apache2
sudo apt-get install -y git
sudo apt-get install -y php libapache2-mod-php php-mysql
sudo apt-get install -y mariadb-client-10.3

#Ahora nos dirigimos a nuestra carpeta compartida, y descargamos nuestro repositorio. 

	cd /
	cd /vagrant
	sudo git clone https://github.com/josejuansanchez/iaw-practica-lamp.git

#Una vez descargado nuestro repositorio copiaremos esa carpeta y la pasaremos a nuestro directorio web de linux. /var/html/www

	sudo cp -r iaw-practica-lamp  /var/www/html/
	
#Ahora cambiaremos el nombre para que nuestra práctica sea mas orientativa. 

	cd /var/www/html/
	mv iaw-practica-lamp Practica
	
#Ahora modificaremos nuestro fichero config.php ubicado dentro de nuestra carpeta "Practica" /src.

	sudo sed -i -e "3s/define('DB_HOST', 'localhost');/define('DB_HOST', '172.16.1.3');/" config.php
    sudo sed -i -e "4s/define('DB_NAME', 'database_name_here');/define('DB_NAME', 'lamp_db');/" config.php
    sudo sed -i -e "5s/define('DB_USER', 'username_here');/define('DB_USER', 'joaquin');/" config.php
    sudo sed -i -e "6s/define('DB_PASSWORD', 'password_here');/define('DB_PASSWORD', 'joaquinpass');/" config.php

#Despues de todo esto, solo queda modificar la ruta de Apache2 para que lea la carpeta.

	cd /etc/apache2/sites-available
	sudo sed -i '12s#DocumentRoot /var/www/html/#DocumentRoot /var/www/html/Practica/src#' /etc/apache2/sites-available/tu-archivo-de-configuracion.conf