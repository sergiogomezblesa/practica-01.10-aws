#!/bin/bash
set -exu

# Importamos los variables de entorno
source .env

# Actualizamos lista de paquetes
apt update

# Instalamos el servidor NFS
apt install -y nfs-kernel-server

# Creamos el directorio que se compartirá
mkdir -p /var/www/html

# Modificamos el usuario y grupo del directorio
chown nobody:nogroup /var/www/html

# Remplazamos los valores de la plantilla
envsubst '${FRONTEN_NETWORK}' < ../nfs/exports.template > /etc/exports

# Reiniciamos el servicio NFS para aplicar los cambios
sudo systemctl restart nfs-kernel-server