#!/bin/bash

ENV=$1
# URL del health check. Se podría obtener de variables de entorno si están configuradas.
URL="http://localhost:8000/health" 

# Lógica de bucle para esperar a que la app esté lista
for i in $(seq 1 10); do
    sleep 5
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $URL)
    if [ "$RESPONSE" -eq 200 ]; then
        echo "Health check en el entorno de $ENV OK."
        exit 0
    fi
done

echo "Health check en el entorno de $ENV FALLÓ."
exit 1
