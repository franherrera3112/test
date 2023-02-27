#!/bin/bash

# Initialize Terraform
terraform init

# Import the existing Docker network
terraform import docker_network.network network_name

# Import the existing Docker volume
terraform import docker_volume.nginx volume_name

# Import the existing Docker container
terraform import docker_container.nginx container_name
