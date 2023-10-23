
## Índice

1. [Introducción Pila-Lamp](#Introducción-Pila-Lamp)
   1.1. [Escenario de la practica](#Escenario-de-la-practica)
   1.2. [Instalación Pila-Lamp](#Instalación-Pila-Lamp)
   1.3. [Importancia de la Pila LAMP](#importancia-de-la-pila-lamp)


## Introducción Pila-Lamp

En esta práctica, pondremos a prueba nuestros conocimientos sobre la Arquitectura LAMP en dos niveles. Esto significa que desplegamos nuestras aplicaciones, como "Apache2", "Linux", "MariaDB o MySQL" y PHP, en un entorno virtualizado gracias a la herramienta "Vagrant". Esta herramienta nos permitirá virtualizar nuestro escenario con solo unos pocos clics, y a continuación os enseñaremos la instalación y modificaciones necesarias para desplegar dicho entorno.
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/b893fabd-652d-4ab7-ba1c-a7851c2531f7)


## Escenario de la práctica
Nuestra práctica consistirá en lo siguiente: Tendremos dos máquinas con dos servicios distintos pero desplegadas con nuestra herramienta **Vagrant** que nos permitirá llevar a cabo este escenario.
1) Tenemos una máquina con conexión a internet NAT, está será en la que tengamos los servicios "Apache" , "PHP", MariaDB-client instalados, a su vez tiene que hacer ping con nuestro servidor "MariaDB".
2) Tenemos una segunda máquina como hemos mencionado anteriormente en la cual tendremos instalado el Servidor "MariaDB", está no tendrá salida a internet, pero si podrá hacer ping con el servidor apache.
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/df903f78-0af6-42e8-aa14-086280cea2aa)
3) Obligatorio tener una carpeta compartida entre ambas máquinas.
4) Trabajaremos con las IP 's que se representan en el esquema.

## Instalación Pila-Lamp

Ahora procederemos a desarrollar el escenario mencionado antes con nuestro Vagrantfile, pero antes de eso procederemos a configurar todo nuestro entorno. 
Antes que nada, necesitamos tener instalado vagrant.
Una vez instalado vagrant, ejecutaremos nuestro CMD de windows. 
En el CMD de windows nos dirigimos o nos creamos un directorio donde vayamos a trabajar, en mi caso lo hice así. 

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/08dd2c7c-2039-400a-9e84-f78de5cd2dac)

Accedemos dentro de nuestra carpeta por medio del comando "cd", una vez dentro ejecutamos el comando ***"vagrant init***.
Esto nos generará el famoso fichero "Vagrantfile" con el cual empezaremos a trabajar.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/c16e468d-a51c-4b51-af79-2f7d04e1f3ab)

Ahora editamos nuestro ***"Vagrantfile"***, pero
Antes que nada, trabajaremos con el siguiente box, ***config.vm.box = "debian/contrib-buster64"*** 
Desde este enlace podremos ver los box que tiene vagrant. https://app.vagrantup.com/boxes/search
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/90795c2e-3296-470c-847f-02cffe81b084)

La ventaja de este box es que nos permite montar carpetas entre las dos máquinas sin errores de montaje. 

Ahora os mostraremos nuestro Vagrantfile modificado. 
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/00f62e85-e989-47a6-a7cb-6dc509897e9d)



## Componentes de la Pila LAMP

En esta sección, se describen los componentes de la Pila LAMP.

## Importancia de la Pila LAMP

Esta parte aborda la importancia de la Pila LAMP en el desarrollo web.

[...]
