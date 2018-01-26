# Docker for Yocto Build
Docker Image with Ubuntu 16.04 and all dependencies to perform a yocto build

## Generate Docker Image

        sudo docker build --rm=true --tag docker-yocto-build .
        
## Run Docker Image

        sudo docker run --rm --privileged -ti -h docker
