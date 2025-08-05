#!/bin/bash

ENV=$1

# Cargar variables de entorno de forma robusta
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Exportar las variables para que docker compose las reconozca
export DOCKERHUB_USERNAME
export DOCKERHUB_TOKEN

echo $DOCKERHUB_USERNAME

# Detener los contenedores actuales
docker compose -f docker-compose.${ENV}.yml down

# Pull de las imágenes más recientes desde Docker Hub
docker compose -f docker-compose.${ENV}.yml pull

# Iniciar los servicios con las nuevas imágenes
docker compose -f docker-compose.${ENV}.yml up -d
