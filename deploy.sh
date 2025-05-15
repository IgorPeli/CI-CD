#!/bin/bash

echo "Subindo containers com Docker Compose..."

# Verifica se docker compose (plugin v2) está disponível
if command -v docker compose &> /dev/null; then
  docker compose up -d --build
# Se não tiver o plugin v2, tenta o docker-compose clássico
elif command -v docker-compose &> /dev/null; then
  docker-compose up -d --build
else
  echo "❌ Docker Compose não está instalado nesta máquina."
  exit 1
fi
