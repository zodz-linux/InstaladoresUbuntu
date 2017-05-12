#!/bin/bash

clear
home=$( ls /home )
option=$( zenity --list --title="Configurador Ubuntu 16.04 o superior " \
     --text="Seleccione una operacion a realizar de la lista." \
     --radiolist \
     --width="500" \
     --height="290" \
     --column="" --column="#" --column="Acción" --column="Descripción" \
     FALSE 1 "Instalar SW" " Instala algunos  programas recomendados" \
     FALSE 2 "Recargar" " Recarga las fuentes del SW" \
     FALSE 3 "Actualizar" "Instala las actualizaciones" \
     FALSE 4 "Todo" "Ejecuta los pasos 1,2,3,4"  \
     FALSE 5 "Deb" "Instala !TODOS¡ los .deb en  /home/$home " \
     FALSE 6 "Java" "Instalar  Java 8"  \
     FALSE 7 "Informe" "Deshabilita el  informe de  errores" )

case $option in

;;

1)
printf "\n\t Seleccionaste la opcion de instalar SW.\n\n"
apt-get -y install synaptic gdebi gparted p7zip-full zram-config audacious bleachbit preload rar vlc ffmpeg unrar git  wget  build-essential gnome-nettool gimp gimp-data-extras gedit-plugins nautilus-admin shotwell

;;

2)
printf "\n\t Seleccionaste la opcion de recargar.\n\n"
apt-get update
apt-get -y autoremove

;;

3)

printf "\n\t Seleccionaste la opcion de actualizar.\n\n"
apt-get -y upgrade
update-manager

;;

4)

printf "\n\t Seleccionaste la opcion TODO.\n\n"
apt-get -y install synaptic gdebi gparted p7zip-full zram-config audacious bleachbit preload rar vlc ffmpeg unrar git  wget  build-essential gnome-nettool gimp gimp-data-extras gedit-plugins nautilus-admin
apt-get update && apt-get -y upgrade
update-manager

;;

5)

printf "\n\t Seleccionaste la opcion DEB.\n\n"
apt-get install  gdebi
gdebi -n  *.deb

;;

6)
printf "\n\t Seleccionaste Instalar Java.\n\n"
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y  oracle-java8-installer

;;

7)

printf "\n\t Seleccionaste Deshabilitar informe de errores.\n\n"
sed -i "4d" /etc/default/apport
echo "enabled=0" >> /etc/default/apport

;;

esac
