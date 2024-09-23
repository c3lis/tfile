#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then 

function install(){
	path="$(echo $PWD)"
	cat log.txt 2>/dev/null
cat tfile/.upload_.php | sed "s|uploads|$path/tfile/uploads|g" > tfile/upload.php
	
	sudo cp -r tfile/ /var/www/html ; chmod 777 $path/tfile/uploads

	if [ "$(apache2 -help &>/dev/null ; echo $?)" -eq 1 ]; then
		echo "iniciando apache2" 
		if [ "$(sudo service apache2 start &>/dev/null ; echo $?)" -eq 0 ];then
			echo "	* apache2 iniciado"
			echo -e "	* Ruta de carpeta : $path/tfile/uploads/"
			echo -e "	* Url : http://$(hostname -I)/tfile/" | tr -d  " " | sed 's/Url:/ Url : /g'
			echo -e "\n			Proceso terminado\n"
		else
			echo "error al iniciar apache2"
		fi
	else
		echo "Instalando apache2" ; sudo apt-get install apache2 -y &>/dev/null
		echo "	* Apache instalado"
		echo "Instalando Modulo PHP" ; sudo apt install php libapache2-mod-php -y &>/dev/null
		echo "	* Modulo instalado"
		
	fi
}

install


else
	echo "permiso denegado"

fi
