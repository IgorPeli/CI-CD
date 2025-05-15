#!/bin/bash

cd /home/ec2-user/app || exit

echo "Atualizando código..."
git pull origin main

echo "Subindo containers..."
docker compose up -d --build
