# Docker compose with file yml

First, we need to create the file "docker-compose.yml"

## To create the containers

    docker-compose up
or
    docker-compose up -d

## To check the state of the containers

    docker-compose ps

## To see the logs

    docker-compose logs

Or we can see the log in real time with "-f" flag

    docker-compose logs -f

To see logs of specific container (i.e: container "dockerapp"):

    docker-compose logs dockerapp

## To stop the containers

    docker-compose stop

## To remove the containers

    docker-compose rm

## To re-build the containers

If we modify an image and we need to re-build the container to changes takes effect

    docker-compose build
