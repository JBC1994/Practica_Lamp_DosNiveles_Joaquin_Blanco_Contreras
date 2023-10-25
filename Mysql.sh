echo "Hola soy la maquina con el servicio MariaDB, vamos a proceder con el script de aprovisionamiento para la instalacion de los servicios"

sudo apt -y update
sudo apt install -y mariadb-server-10.3

echo "No necesitas internet como servidor MariaDB"

sudo ip route del default
