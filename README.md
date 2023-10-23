## Índice

1. [Introducción Pila-Lamp](#Introducción-Pila-Lamp)
   1.1. [Escenario de la practica](#Escenario-de-la-practica)
   1.2. [Instalación Pila-Lamp](#Instalación-Pila-Lamp)
   1.3. [Importancia de la Pila LAMP](#importancia-de-la-pila-lamp)



## Introducción Pila-Lamp

En esta práctica, pondremos a prueba nuestros conocimientos sobre la Arquitectura LAMP en dos niveles. Esto significa que desplegaremos nuestras aplicaciones, como "Apache2", "Linux", "MariaDB o MySQL" y PHP, en un entorno virtualizado gracias a la herramienta "Vagrant". Esta herramienta nos permitirá virtualizar nuestro escenario con solo unos pocos clics, y a continuación os enseñaremos la instalación y modificaciones necesarias para ejecutar dicho entorno.
![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/b893fabd-652d-4ab7-ba1c-a7851c2531f7)


## Escenario de la practica
Nuestra práctica consistirá en lo siguiente: Tendremos dos máquinas con dos servicios distintos pero desplegadas con nuestra herramienta **Vagrant** que nos permitirá llevar a cabo este escenario.
1) Tenemos una maquina con conexión a internet NAT, está será en la que tengamos los servicios "Apache" , "PHP", MariaDB-client instalados, a su vez tiene que hacer ping con nuestro servidor "MariaDB".
2) Tenemos una segunda maquina como hemos mencionado anteriormente en la cual tendremos instalado el Serviodor "MariaDB", está no tendrá salida a internet, pero si podrá hacer ping con el servidor apache.

![image](https://github.com/JBC1994/Practica_Lamp_DosNiveles_Joaquin_Blanco_Contreras/assets/120668110/df903f78-0af6-42e8-aa14-086280cea2aa)

Trabajaremos con las IP's que se representan en el esquema.


## Instalación Pila-Lamp

Bien, hemos visto que con nuestra introducción nos ha quedado mas claro lo que es un entorno "Pila LAMP". Ahora procederemos a desarrollar dicho entorno. 
Antes que nada, tenemos que tener nuestro vagrant instalado, para ello iremos a su pagina oficial y lo descargaremos e instalaremos.
Una vez instalado vagrant empezaremos a trabajar, lo primero de todo es crearnos un directorio en el cual poder trabajar de manera facil y sencilla, en el cual tambien poder meter nuestros script de aprovisionamiento. 
Os muestro un ejemplo de la organización:



## Componentes de la Pila LAMP

En esta sección, se describen los componentes de la Pila LAMP.

## Importancia de la Pila LAMP

Esta parte aborda la importancia de la Pila LAMP en el desarrollo web.

[...]
