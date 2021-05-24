# Docker

Docker information and code

## Install Docker in Ubuntu

### Step by step from official website

    https://docs.docker.com/engine/install/ubuntu/

    # Remove older versions
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update

    # Install docker
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get update

    # To test docker installation
    sudo docker run hello-world
    sudo docker run -it ubuntu bash
    sudo docker info

__________________

## Images

* Images are read only templates used to create containers.
* Images are created with the docker build command.
* Images are composed of layers of other images.
* Images are stored in registries.

__________________

## Containers

* Containers are portable encapsulations of an environment in which to run apps.
* Containers are created from images. Inside a container, it has all the binaries and dependencies needed to run the app.

__________________

## Registries and Repositories

* A registry is where we store out images.
* Inside a registry, images are stored in repositories.
* Repository is a collection of different docker images with the same name and different tags (different version of the image).

__________________

## DockerHub

It's a public registry. For example, we can search SQL images.

    https://hub.docker.com/

__________________
