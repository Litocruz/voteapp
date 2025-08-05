#!/bin/bash

ENV=$1

# Navegar al directorio del proyecto
cd /home/jlamadrid/code/dia21/roxs-voting-app

# Cargar variables de entorno
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Detener los contenedores actuales
docker compose -f docker-compose.${ENV}.yml down

# Pull de las imágenes más recientes desde Docker Hub
docker compose -f docker-compose.${ENV}.yml pull

# Iniciar los servicios con las nuevas imágenes
docker compose -f docker-compose.${ENV}.yml up -d
