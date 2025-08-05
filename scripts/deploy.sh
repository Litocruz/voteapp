#!/bin/bash

ENV=$1

# Cargar variables de entorno de forma robusta
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Detener los contenedores actuales
docker compose -f docker-compose.${ENV}.yml down

# Pull de las imágenes más recientes desde Docker Hub
docker compose -f docker-compose.${ENV}.yml pull

# Iniciar los servicios con las nuevas imágenes
docker compose -f docker-compose.${ENV}.yml up -d
