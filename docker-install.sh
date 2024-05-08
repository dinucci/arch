#!/bin/bash

# Update the package list
sudo pacman -Syy

# Install the necessary dependencies
sudo pacman -S --noconfirm \
  docker \
  docker-compose \
  docker-machine \
  containerd \
  runc \
  docker-cli

# Enable and start the Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Configure the Docker daemon to start at boot
sudo systemctl enable docker.socket
sudo systemctl start docker.socket

# Create a Docker group and add the current user to it
sudo groupadd docker
sudo usermod -aG docker $USER

# Reload the systemd daemon to pick up the new configuration
sudo systemctl daemon-reload

# Restart the Docker service to apply the changes
sudo systemctl restart docker

# Verify that Docker is installed and running correctly
docker --version
docker-compose --version
docker-machine --version
docker info

# Print a success message
echo "Docker installation complete!"
