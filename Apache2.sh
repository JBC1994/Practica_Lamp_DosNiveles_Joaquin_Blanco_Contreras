echo "Hola soy la maquina con Apache2, vamos a proceder con el script de aprovisionamiento para la instalación de los servicios" 

sudo apt-get -y update
sudo apt-get install -y apache2
sudo apt-get install -y git
sudo apt-get install -y php libapache2-mod-php php-mysql
sudo apt-get install -y mariadb-client-10.3
