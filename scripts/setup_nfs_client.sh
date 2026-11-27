#!/bin/bash
set -exu

# Importamos los variables de entorno
source .env

# Actualizamos lista de paquetes
apt update

# Instalamos el cliente NFS
apt install nfs-common -y

# Montamos el directorio compartido desde el servidor NFS
mount ${NFS_SERVER_IP}:/var/www/html /var/www/html

# Configuramos el montaje automático en /etc/fstab
echo "${NFS_SERVER_IP}:/var/www/html /var/www/html nfs defaults 0 0" >> /etc/fstab