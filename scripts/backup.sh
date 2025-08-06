#!/bin/bash

# Cargar variables de entorno de forma robusta
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Definir variables de la base de datos
DB_USER=${DATABASE_USER}
DB_NAME=${DATABASE_NAME}
DB_HOST=${DATABASE_HOST}

# Nombre del servicio de PostgreSQL en docker-compose
POSTGRES_SERVICE_NAME="postgres"

# Crear un nombre de archivo de respaldo con marca de tiempo
BACKUP_FILE="/home/jlamadrid/code/dia21/roxs-voting-app/backups/${DB_NAME}_$(date +%Y%m%d_%H%M%S).sql"

echo "Iniciando respaldo de la base de datos ${DB_NAME} en ${DB_HOST}..."

# Ejecutar pg_dump dentro del contenedor de PostgreSQL
docker compose exec -T ${POSTGRES_SERVICE_NAME} pg_dump -U ${DB_USER} -d ${DB_NAME} > "${BACKUP_FILE}"

if [ $? -eq 0 ]; then
  echo "Respaldo de la base de datos completado exitosamente: ${BACKUP_FILE}"
else
  echo "Error al realizar el respaldo de la base de datos."
  exit 1
fi
