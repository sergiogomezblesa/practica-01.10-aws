#!/bin/bash
set -ex

#Actualizar repositorios
apt update

#Instalamos el sistema gestor de bases de datos MySQL
sudo apt install mysql-server -y

# Configuramos MSQL para que pueda ser accedido desde cualquier host
 sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos el servicio de MySQL
systemctl restart mysql