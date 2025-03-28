#!/bin/bash

# Update the system
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Verify Docker installation
sudo docker --version

# Pull Docker image from Docker Hub
DOCKER_IMAGE="rv26/hospital-management:latest"
sudo docker pull $DOCKER_IMAGE

# Run Docker container
sudo docker run -d -p 80:8000 $DOCKER_IMAGE

# Confirm container is running
sudo docker ps

echo "Docker container is running on port 80."