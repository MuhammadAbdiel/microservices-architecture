#!/bin/sh

# nama package
package_name="ghcr.io/muhammadabdiel/shipping-service:latest"

# membuat image di Docker dengan format untuk GitHub Container Registry
echo -e "Building a new Docker image:"
docker build . -t $package_name

# log masuk ke GitHub Container Registry
echo -e "\nLogin into GitHub Container Registry:"
echo $GHRS_PAT_TOKEN | docker login ghcr.io -u muhammadabdiel --password-stdin

# mengunggah image ke GitHub Container Registry
echo -e "\nPublishing image to GitHub Container Registry:"
docker push $package_name