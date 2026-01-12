#!/bin/bash

# scripts/install-docker.sh
# This script installs Docker and Docker Compose on a RHEL 19 system.
echo "Starting Docker Installation..."
# Update the system
sudo dnf update -y
# Install required packages
sudo dnf install -y dnf-plugins-core
# Add Docker repository
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
# Install Docker
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Start and enable Docker service
sudo systemctl enable --now docker
# Verify Docker installation
sudo docker run hello-world
echo "Docker Installation Completed."
