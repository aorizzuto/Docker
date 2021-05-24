# Run docker container in background

We'll use "-d" to request Docker to run our container in background.

We'll execute "sleep 1000" just to execute a command. We can execute any command in here.

Docker will return the ID of the container

    (docker) ale:~$ docker run -d busybox:1.24 sleep 1000
    54bb78983abfa518daac5ce3fe7c981d49a906a0cc0f8eed11972857ad01b24b
    (docker) ale:~$ 

## Verify the process in background with PS

    (docker) ale:~$ docker ps
    CONTAINER ID   IMAGE          COMMAND        CREATED         STATUS         PORTS     NAMES
    54bb78983abf   busybox:1.24   "sleep 1000"   3 minutes ago   Up 2 minutes             festive_noyce
    (docker) ale:~$

