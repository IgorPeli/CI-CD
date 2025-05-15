#!/bin/bash

echo "Subindo containers com Docker Compose..."

# Verifica se 'docker compose' (plugin) está disponível
if command -v docker &> /dev/null && docker compose version &> /dev/null; then
  echo "→ Usando docker compose (plugin v2)"
  docker compose up -d --build

# Verifica se 'docker-compose' clássico está disponível
elif command -v docker-compose &> /dev/null; then
  echo "→ Usando docker-compose (clássico)"
  docker-compose up -d --build

else
  echo "Nenhuma versão do Docker Compose encontrada."
  echo "Instale com:"
  echo "curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose"
  echo "chmod +x ~/.docker/cli-plugins/docker-compose"
  exit 1
fi
