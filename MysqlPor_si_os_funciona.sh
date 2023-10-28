echo "Hola soy la maquina con el servicio MariaDB, vamos a proceder con el script de aprovisionamiento para la instalacion de los servicios"

sudo apt -y update
sudo apt install -y mariadb-server-10.3

echo "No necesitas internet como servidor MariaDB"

sudo ip route del default

#vamos a nuestro directorios raiz

	cd /

#Accedemos a la carpeta compartida "Vagrant"

	cd /vagrant

#Movemos el repositorio descargado por máquina cliente "Apache2" y lo pasamos a nuestro $HOME.

	mv iaw-practica-lamp $HOME

#Volvemos a nuestro $HOME

	cd $HOME

#Cargamos la BBDD en nuestro server. 

	sudo mysql -u root < iaw-practica-lamp/db

#Una vez cargada la BBDD, vamos a nuestro directorio "/etc/mysql/mariadb.conf.d" y editamos nuestro fichero de configuración, "50-server.cnf", por la IP de nuestro server.

	cd /etc/mysql/mariadb.conf.d
	sudo sed -i '28s/bind-address\s*=\s*127\.0\.0\.1/bind-address = 172.16.1.3/' 50-server.cnf

#Ahora nos logeamos con root y creamos nuestro usuario, le indicaremos también la ip de la máquina apache2 con la cual ese usuario se conectará.

	sudo mysql -u root -p
	CREATE USER 'joaquin'@'172.16.1.2' IDENTIFIED BY 'joaquinpass';
	GRANT ALL PRIVILEGES ON *.* TO 'joaquin'@'172.16.1.2';
	FLUSH PRIVILEGES;
	exit
