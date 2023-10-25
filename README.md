## <p align="center">Índice</p>


1.0. [Introducción Pila-Lamp](#Introducción-Pila-Lamp)
-    1.1. [Escenario de la practica](#Escenario-de-la-práctica)
-    1.2. [Configuración Vagrantfile](#Configuración-Vagrantfile)
-    1.3. [Script De Aprovisionamientos](#Script-De-Aprovisionamiento)

2.0. [Despliegue de la herramienta Vagrant](#Despliegue-de-la-herramienta-Vagrant) 
-    2.1. [Escenario de la practica](#Escenario-de-la-práctica)
-    2.2. [Carpeta Compartida En Vagrant](#Carpeta-Compartida-En-Vagrant)

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
Antes que nada, necesitamos tener instalado vagrant desde su pagina oficial e instalarlo.
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
		m1.vm.network "forwarded_port", guest: "Puerto Local de la máquina", host:"Puerto a traves del cual queremos redigir la salida de la máquina"**
  
## Script-De-Aprovisionamiento

Si queremos que nuestro **Vagrantfile** sea productivo junto con nuestras máquinas. Lo correcto sería tener un Script que nos permita automatizar todos los procesos o al menos tener todos los servicios que necesitamos en cada máquina instalados. De esta manera nos ahorraremos tiempo para montar cualquier escenario y poder trabajar en él.
A continuacion os mostramos los nuestros, los cuales hacen posible esta configuración PilaLamp.

**Este sería el Script para nuestro Apache2.**

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/c8b2f2e5-a3f5-4fd5-8b85-51ef37aca3a3)

**Este último para nuestro Servidor MariaDB.**

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/bf91d03c-374a-4f52-bbd9-c95905fd0a88)


## Despliegue de la herramienta Vagrant

Bien, para desplegar nuestra herramienta Vagrant con las configuraciones que previamente hemos echo, es tan fácil como acceder a nuestra terminal de windows shell en el directorio donde tenemos nuestro escenario y hacer un **"Vagrant up"** , Esto hará que la ejecución de las máquinas junto con sus configuraciones sean efectivas a los cambios propocionados. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/43d0577c-d2e8-4dca-bf88-3ec057fa2567)

Como vemos se han iniciado las dos máquinas correctamente, ahora solo queda conectarse a cada una de ellas por medio del comando "Vagrant ssh "nombre de la maquina", en mi caso he abierto dos ventas de shell de windows para poder trabajar mejor. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/36a1f678-993b-403b-a40a-fe154afbe5e0)

He aprovechado y os hice un ping entre las dos máquinas para que se pueda apreciar, que existe conexión entre ellas. De la misma manera la máquina "JoaquinMysql" no debe de tener internet. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/c131b2e3-b710-4ae4-ba46-73c0a276dadb)


## Carpeta Compartida En Vagrant

Ahora tenemos que comprobar que nuestra carpeta compartida funciona. Para ello nos dirigimos a la raiz del sistema donde la encontraremos con el nombre **"vagrant"**.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/86681a27-a6bb-4c48-8ee4-0dd6c8419d11)

Como vemos todo funciona correctamente, pero, ¿Tenemos instalados los servicios proporcionados que pusimos en el script de provisionamiento?

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/2fdd861f-a89c-4f46-b364-25cadb0e89eb)

Pues efectivamente nuestro Script se ejecutó con éxito cuando iniciamos nuestra herramienta vagrant. 
En la Máquina Apache2 instalo los servicios de cliente y en la máquina servidor instaló el servidor MariaDB.





