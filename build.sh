#!/bin/bash

docker compose up -d
echo "Aguardando o PostgreSQL estar pronto..."
until docker exec api-email-db pg_isready -h localhost -U postgres; do
  echo "PostgreSQL ainda não está pronto, esperando 1 segundo..."
  sleep 1
done
echo "PostgreSQL está pronto!"
docker exec api-email-app php artisan migrate --force