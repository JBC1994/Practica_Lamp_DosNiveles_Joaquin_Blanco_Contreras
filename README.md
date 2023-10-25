## <p align="center">Índice</p> 
### <p align="right">Joaquin Blanco Contreras, Curso: ASIR2</p>


1.0. [Introducción Pila-Lamp](#Introducción-Pila-Lamp)
-    1.1. [Escenario De La práctica](#Escenario-de-la-práctica)
-    1.2. [Configuración Vagrantfile](#Configuración-Vagrantfile)
-    1.3. [Script De Aprovisionamientos](#Script-De-Aprovisionamiento)

2.0. [Despliegue De La herramienta Vagrant](#Despliegue-de-la-herramienta-Vagrant) 
-    2.1. [Escenario De La práctica](#Escenario-de-la-práctica)
-    2.2. [Carpeta Compartida En Vagrant](#Carpeta-Compartida-En-Vagrant)

3.0. [Descarga De Repositorios](#Descarga-de-repositorios)
-    3.1. [Configuración De Cliente Apache2](#Configuración-de-Cliente-Apache2)
-    3.2. [Configuración De Servidor MariaDB](#Configuración-De-Servidor-MariaDB)

4.0. [Pila Lamp en marcha](#Pila-Lamp-en-marcha) 
-    4.1. [Consulta desde cliente Apache2 A Servidor MariaDB](#Consulta-desde-cliente-Apache2-A-Servidor-MariaDB)
-    4.2. [Comprobación de consulta con servidor MariaDB](#Comprobación-de-consulta-con-servidor-MariaDB)

5.0.[Vagrantfile](#Vagrantfile)
-    5.1. [Configuración Vagrantfile](#Configuración-Vagrantfile)
-    5.1. [Script Aprovisionamiento Apache2](#Script-Aprovisionamiento-Apache2)
-    5.1. [Script Aprovisionamiento Mysql](#Script-Aprovisionamiento-Mysql)



## Introducción Pila-Lamp

En esta práctica, pondremos a prueba nuestros conocimientos sobre la Arquitectura LAMP en dos niveles. Esto significa que desplegamos nuestras aplicaciones, como "Apache2", "Linux", "MariaDB o MySQL" y PHP, en un entorno virtualizado gracias a la herramienta "Vagrant". Esta herramienta nos permitirá virtualizar nuestro escenario con solo unos pocos clics, y a continuación os enseñaremos la instalación y modificaciones necesarias para desplegar dicho entorno.
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/b893fabd-652d-4ab7-ba1c-a7851c2531f7)


## Escenario de la práctica

Nuestra práctica consistirá en lo siguiente: Tendremos dos máquinas con dos servicios distintos pero desplegadas con nuestra herramienta **Vagrant** que nos permitirá llevar a cabo este escenario.
1) Tenemos una máquina con conexión a internet NAT, está será en la que tengamos los servicios "Apache" , "PHP", MariaDB-client instalados, a su vez tiene que hacer ping con nuestro servidor "MariaDB".
2) Tenemos una segunda máquina como hemos mencionado anteriormente en la cual tendremos instalado el Servidor "MariaDB", está no tendrá salida a internet, pero si podrá hacer ping con el servidor apache.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/df903f78-0af6-42e8-aa14-086280cea2aa)

4) Obligatorio tener una carpeta compartida entre ambas máquinas.
5) Trabajaremos con las IP 's que se representan en el esquema, puerto 80 al 9000 en la máquina Apache2.

## Configuración Vagrantfile

Procederemos a desarrollar el escenario mencionado con nuestro Vagrantfile. 
Antes que nada, necesitamos tener instalado vagrant desde su página oficial e instalarlo.
Una vez instalado vagrant, nos dirigimos al directorio donde vayamos a trabajar y ejecutamos la shell terminal de windows, en mi caso lo hice así. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/08dd2c7c-2039-400a-9e84-f78de5cd2dac)

Accedemos dentro de nuestra carpeta por medio del comando "cd", una vez dentro, ejecutamos el comando ***"vagrant init***.
Esto nos generará el famoso fichero **"Vagrantfile"** con el que empezaremos a trabajar.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/c16e468d-a51c-4b51-af79-2f7d04e1f3ab)

Ahora editamos nuestro ***"Vagrantfile"***, pero,
Antes que nada, trabajaremos con el siguiente box, ***config.vm.box = "debian/contrib-buster64"*** 
Desde este enlace podremos ver los box que tiene vagrant. https://app.vagrantup.com/boxes/search

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/90795c2e-3296-470c-847f-02cffe81b084)

***La ventaja de este box es que nos permite montar carpetas entre las dos máquinas sin errores de montaje.***

Ahora os mostraremos nuestro Vagrantfile modificado. 
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/1241a52a-ece2-4722-bda0-e9c7afe9479d)

Bien, como vemos en nuestro Vagrantfile tenemos varios apartados que son fundamentales, con los que tenemos que familiarizarnos y saber lo que estamos haciendo. 

	 **m1.vm.hostname = "Nombre de la máquina"
  		m1.vm.network "private_network", ip: "Red que queremos que la máquina tenga"
		m1.vm.provision "shell", path: "Script de aprovisionamiento"
		m1.vm.synced_folder "Nuestra carpeta compartida"
		m1.vm.network "forwarded_port", guest: "Puerto Local de la máquina", host:"Puerto a través del cual queremos redirigir la salida de la máquina"**
  
## Script-De-Aprovisionamiento

Si queremos que nuestro **Vagrantfile** sea productivo junto con nuestras máquinas. Lo correcto sería tener un Script que nos permita automatizar todos los procesos o al menos tener todos los servicios que necesitamos en cada máquina instalados. De esta manera nos ahorraremos tiempo para montar cualquier escenario y poder trabajar en él.
A continuación os mostramos los nuestros, los cuales hacen posible esta configuración PilaLamp.

**Este sería el Script para nuestro Apache2.**

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/c8b2f2e5-a3f5-4fd5-8b85-51ef37aca3a3)

**Este último para nuestro Servidor MariaDB.**

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/bf91d03c-374a-4f52-bbd9-c95905fd0a88)


## Despliegue de la herramienta Vagrant

Bien, para desplegar nuestra herramienta Vagrant con las configuraciones que previamente hemos echo, es tan fácil como acceder a nuestra terminal de windows shell en el directorio donde tenemos nuestro escenario y hacer un **"Vagrant up"** , Esto hará que la ejecución de las máquinas junto con sus configuraciones sean efectivas a los cambios proporcionados. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/43d0577c-d2e8-4dca-bf88-3ec057fa2567)

Como vemos se han iniciado las dos máquinas correctamente, ahora solo queda conectarse a cada una de ellas por medio del comando "Vagrant ssh "nombre de la máquina", en mi caso he abierto dos ventas de shell de windows para poder trabajar mejor. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/36a1f678-993b-403b-a40a-fe154afbe5e0)

He aprovechado y os hice un ping entre las dos máquinas para que se pueda apreciar, que existe conexión entre ellas. De la misma manera la máquina "JoaquinMysql" no debe de tener internet. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/c131b2e3-b710-4ae4-ba46-73c0a276dadb)


## Carpeta Compartida En Vagrant

Ahora tenemos que comprobar que nuestra carpeta compartida funciona. Para ello nos dirigimos a la raíz del sistema donde la encontraremos con el nombre **"vagrant"**.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/86681a27-a6bb-4c48-8ee4-0dd6c8419d11)

Como vemos todo funciona correctamente, pero, ¿Tenemos instalados los servicios proporcionados que pusimos en el script de aprovisionamiento?

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/2fdd861f-a89c-4f46-b364-25cadb0e89eb)

Pues efectivamente nuestro Script se ejecutó con éxito cuando iniciamos nuestra herramienta vagrant. 
En la Máquina Apache2 instaló los servicios de cliente y en la máquina servidor instaló el servidor MariaDB.

## Descarga De Repositorios

Una vez aquí empezaremos con la descarga de los repositorios para poder hacer nuestra la práctica, con el enlace que os proporcionaré a continuación ejecutaremos el comando **Sudo git clone** ***"URL"***. 
El enlace sería el siguiente: 
https://github.com/josejuansanchez/iaw-practica-lamp.git 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/5ff3bf47-ea31-4ab4-ad7b-05ce35fbc1d1)

Automáticamente lo veremos descargado en nuestra carpeta compartida, la razón de descargarlo ahí es, porque la máquina server no puede acceder a internet y necesita la base de datos que proporciona este repositorio, y así poder cargarla a nuestro server "MariaDB".
Desde la máquina server he copiado dicho repositorio a mi directorio **$HOME**, para poder ejecutar y cargar la BBDD que viene en él.
Los comandos utilizados para cargar la BBDD son, ***sudo mysql -u root < db/database.sql***

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/4195e05c-df91-4633-9089-35789c89ae89)

## Configuración De Cliente Apache2

En mi caso, para hacerlo más fácil me copié el repositorio descargado y lo ubiqué en la ruta **/var/www/html/** que es donde Apache2 y Linux guardan sus sitios webs por defecto. Cambié nombre para hacerlo mas orientativo **Práctica**.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/481839e4-90dc-4f3d-98b4-352687dab9b4)

En este caso como vemos dentro de nuestra carpeta **Práctica** Tenemos un directorio donde atacar llamado **SRC**, ahí será donde nuestro servidor Apache tendrá que escuchar, para ello iremos a la siguiente ruta:
***cd /etc/apache2/sites-available/***

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/3fbf85f4-0ffc-4f5b-8826-e037c675c209)


Ahora editaremos nuestro fichero de configuración ***000-default.conf*** para que escuche en la ruta de nuestro directorio **Práctica/src**. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/8d6753ba-4569-48cf-8d38-f175ded36af9)


## Configuración De Servidor MariaDB

Hemos conseguido tener nuestro repositorio en nuestro $HOME, cargar la BBDD a nuestro servidor, pero ahora necesitamos este servidor funcione correctamente, para ello tenemos que editar nuestro fichero de configuración llamado **"50-server.cnf"**, que lo encontraremos en el siguiente directorio. ***/etc/mysql/mariadb.conf.d/50-server.cnf ***.
De lo que se trata aquí es que el servidor **MariaDB** escuche en su dirección IP propia de la máquina local, en este caso la 172.16.1.3. 
Gracias a esto prevenimos que nadie pueda acceder a ella desde el exterior, solo en red local, por lo que ganaremos mucha más seguridad para nuestros datos. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/830f4644-0902-4e1c-a5b6-0419024b2b6a)

Bien, una vez modificado nuestro fichero, crearemos un usuario con privilegios para que pueda acceder a cualquier base de datos, OJO esto es una prueba... **Lo correcto sería que le demos permiso a ese usuario a una base de datos en concreto.**

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/cb5d6919-9293-4f43-9013-b12352a98ce4)

La IP indicada en la práctica es la del cliente Apache2, que será desde donde hagamos la consulta al servidor. 
	
 	Comandos utilizado para la creación de usuario : CREATE USER 'joaquin'@'172.16.1.2' IDENTIFIED BY 'joaquinpass';
  	GRANT ALL PRIVILEGES ON *.* TO 'joaquin'@'172.16.1.2';
	FLUSH PRIVILEGES; -> Para actualizar los cambios.


## Pila Lamp en marcha

Hasta aqui, para poder poner en marcha nuestra prueba nos quedaría editar en la parte del cliente **Apache2** el fichero **Config.php** ubicado en nuestro directorio **/var/www/html/Practica/src**, Al que tendremos que cambiarle la IP con la cual se va a hacer la llamada a nuestro servidor **MariaDB**, la base de datos la cual queremos tratar, nuestro usuario creado en nuestro servidor MariaDB y nuestra password.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/dd3f0f5a-6540-4ac8-80ea-ff2c9ccb077b)

Recordemos que para que los cambios se efectúen correctamente en el servidor **"Apache2"** Tenemos que hacer un restart.

	sudo systemctl apache2 restart

Ahora accedemos a nuestro navegador web, y accedemos a la IP de nuestro servidor **Apache2**. 
Si hemos echo los pasos anteriores correctamente, os debería de salir esto. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/e6f38554-6b49-4bf6-8dba-1c1cf096e856)


## Consulta desde cliente Apache2 A Servidor MariaDB

En este apartado pondremos a prueba nuestra consulta y veremos si efectivamente esos datos introducidos se han echo correctamente. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/d617228e-5b15-45f9-ae5c-ec6a5df48047)

En este caso, el servidor nos indica que ha añadido la información correctamente, successfully!!

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/76313495-7358-4acc-ba6d-527804264f13)

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/079a3a46-491b-4389-a534-a786a8a197f7)



## Comprobación de consulta con servidor MariaDB

En este apartado comprobaremos si es cierto que nuestro Cliente Apache2 ha hecho la consulta correctamente. 

	Comandos utilizados ; 
 				use lamp_db;
 				show tables;
     				select * from users;

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/511b0211-e031-47f5-9c85-9e79bfb58f44)

Vídeo de prueba.


    https://drive.google.com/file/d/1toclZv5NiK4fWScgpWKdZZ3b01COrEYg/view?usp=sharing


##Configuración Vagrantfile


[Uploading # -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  config.vm.box = "debian/contrib-buster64"

#----------------------------------------------------------------------------------------------------------------------------
#-----------------------Apache2----------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------

	config.vm.define "joaquinApache2" do |m1|
		m1.vm.hostname = "JoaquinApache2"
  		m1.vm.network "private_network", ip: "172.16.1.2"
		m1.vm.provision "shell", path: "ScriptMaquinaApache2/Apache2.sh"
		m1.vm.synced_folder "C://Users//JBC//Documents/IMPLANTACION DE APLIACIONES WEB//Practica_Lamp//compartida", "/vagrant"
		m1.vm.network "forwarded_port", guest: 80, host:9000
	end

#----------------------------------------------------------------------------------------------------------------------------
#-----------------------MYSQL------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------

	config.vm.define "joaquinMysql" do |m2|
		m2.vm.hostname = "JoaquinMysql"
  		m2.vm.network "private_network", ip: "172.16.1.3"
		m2.vm.provision "shell", path: "ScriptMaquinaMysql/Mysql.sh"
		m2.vm.synced_folder "C://Users//JBC//Documents/IMPLANTACION DE APLIACIONES WEB//Practica_Lamp//compartida", "/vagrant"
	end
#----------------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessable to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL


## Script Aprovisionamiento Apache2

echo "Hola soy la maquina con Apache2, vamos a proceder con el script de aprovisionamiento para la instalación de los servicios" 

sudo apt-get -y update
sudo apt-get install -y apache2
sudo apt-get install -y git
sudo apt-get install -y php libapache2-mod-php php-mysql
sudo apt-get install -y mariadb-client-10.3


## Script Aprovisionamiento Mysql  

[Uploading Mysql.echo "Hola soy la maquina con el servicio MariaDB, vamos a proceder con el script de aprovisionamiento para la instalacion de los servicios"

sudo apt -y update
sudo apt install -y mariadb-server-10.3

echo "No necesitas internet como servidor MariaDB"

sudo ip route del default
sh…]()

