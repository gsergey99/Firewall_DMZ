# Firewall_DMZ

Gestión de la Seguridad de una Red DMZ y MZ.

## Componentes

-   Eduardo Eiroa Ballester. DNI: 05739801J
-   Sergio Jiménez del Coso. DNI: 45774386Q

## Proceso de Arranque y Prueba

Para arrancar las máquinas deberá seguir el siguiente proceso:

-   cd Firewall_DMZ/
-   vagrant up

Una vez que se hayan creado las máquinas, se podrá acceder a cada una de ellas por medio del siguiente comando:

-   vagrant ssh <**nombre del nodo**>

En el caso de que un nodo tenga que ser actualizado, debido a que se haya producido un cambio en la configuración de dicho nodo, se ejecutará dicho comando:

-   vagrant provision <**nombre del nodo**>

Para destruir todos los nodos, usaremos:

-   vagrant destroy -f

Para realizar las pruebas de cada nodo, se ejecutará el siguiente comando dependiendo del nodo en el que se encuentre:

    ./Prueba<NombreNodo>

## Finalidad de los ficheros

Para la configuración del nodo **router**, hemos realizado un archivo que configura el servicio **DNS** y **DHCP**. Este archivo se ejecuta automáticamente a través de la herramienta *Ansible* denominado **router_config**.

Para los casos de prueba, hemos realizado tres scripts para cada una de las máquinas con el objetivo de realizar una serie de tests:

-   PruebaRouter: PING google.es, PING Web-server, conocer si el cliente tiene una IP estática (Comprueba si el servidor DHCP está en funcionamiento), DNS look up a google.es.

-   PruebaServer: PING google.es, PING router, DNS look up a google.es.

-   PruebaPC1: PING google.es, PING router, PING Web-server, DNS look up a google.es, WGET Web-server, comprobar el funcionamiento del servidor NTP.

Para la monitorización del nodo **Web-server**, hemos instalado el paquete **bmon** con el objetivo de obtener una monitorización en cada una de las interfaces. Para ello, hemos implementado un script en Python con el objetivo de monitorizar cada una de las interfaces junto con diferentes opciones. Para ejecutar dicho script:

    python3 bmon.py

 Además, tambíen hemos incluido otra herramienta de monitorización en el nodo **router** con el objetivo de poder visualizar la monitorización de nuestra herramienta de iptables.

-   NetData.sh: Este archivo de configuración permite instalar de forma manual la herramienta de monitorización de **Net-Data**, ya que al ser un instalador automático, el usuario solo tiene que aceptar los permisos para la instalación de los paquetes asociados a dicha herramienta.

**¡NOTA!** Para poder, visualizar la herramienta de monitorización del nodo **router** en el navegador por defecto, se tiene que añadir una regla en el archivo de _iptables-rule_, que será la siguiente:

```
[TABLA NAT]
-A PREROUTING -i eth1 -p tcp --dport 19999 -j DNAT --to-destination <Router-IP>:19999
```

## Enlace del vídeo

    https://drive.google.com/file/d/1JBGTldjZ7iypkZrtaTfhy7V1Ke_Tv2SQ/view?usp=sharing