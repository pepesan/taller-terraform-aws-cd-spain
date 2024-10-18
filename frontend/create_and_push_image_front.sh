#!/bin/bash

# Nombre de la imagen y tag (puedes modificar el tag si lo deseas)
USERNAME=pepesan
IMAGE_NAME=$USERNAME/awscds_frontend
TAG=latest

# Construir la imagen Docker
echo "Construyendo la imagen Docker..."
docker build -t $IMAGE_NAME:$TAG .

# Iniciar sesión en Docker Hub (solo es necesario si no has iniciado sesión previamente)
echo "Iniciando sesión en Docker Hub..."
docker login

# Pushear la imagen a Docker Hub
echo "Subiendo la imagen a Docker Hub..."
docker push $IMAGE_NAME:$TAG

echo "Imagen subida correctamente: $IMAGE_NAME:$TAG"
