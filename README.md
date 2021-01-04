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

## Finalidad de los ficheros

Para la configuración del nodo **router**, hemos realizado un archivo que configura el servicio **DNS** y **DHCP**. Este archivo se configura automáticamente a través de la herramienta *Ansible*. Este archivo es denominado **router_config**.

Para los casos de prueba, hemos realizado tres scripts para cada una de las máquinas con el objetivo de realizar una serie de tests, por ejemplo: enviar paquetes ICMP a host, salida a Internet...etc:

-   PruebaRouter: PING gooogle.es, PING Web-server, Saber si el cliente tiene una IP estática (Comprueba si el servidor DHCP funciona), DNS look up a google.es.

-   PruebaServer: PING gooogle.es, PING router, DNS look up a google.es.

-   PruebaPC1: PING gooogle.es, PING router, PING Web-server, DNS look up a google.es, WGET Web-server, comporbación del servidor NTP.

Para la monitorización, hemos instalado el paquete **bmon** con el objetivo de obtener una monitorización en cada una de las interfaces. Para ello, hemos implementado un script de python con el objetivo de monitorizar cada uno de las interfaces juntos con diferentes opciones del **Web-server**.

## Enlace del vídeo