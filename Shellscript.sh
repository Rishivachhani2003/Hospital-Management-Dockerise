#!/bin/bash

# Update system packages and install prerequisites
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository for Docker
sudo add-apt-repository \
   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) stable"
echo "step 1 completed" 

# # Install Docker
# sudo apt-get update -y
# sudo apt-get install -y docker-ce docker-ce-cli containerd.io
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
echo "docker installed successfully"

# Verify Docker installation
docker --version
echo "docker version installed successfully"


# Define variables
DOCKERFILE_PATH="./Dockerfile"  # Path to the Dockerfile in your project directory
DOCKER_IMAGE="my_docker_image"  # Image name
CONTAINER_NAME="dockerfile_container"

# Build Docker image from Dockerfile
echo "Building Docker image: $DOCKER_IMAGE"
sudo docker build -t $DOCKER_IMAGE -f $DOCKERFILE_PATH .

# Run a container from the built image
echo "Running Docker container: $CONTAINER_NAME"
sudo docker run -d --name $CONTAINER_NAME $DOCKER_IMAGE

# Display running containers
echo "Currently running containers:"
sudo docker ps

# Print success message
echo "Docker container '$CONTAINER_NAME' is running successfully."
# after updating shell scripts