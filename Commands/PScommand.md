# PS Command

    (docker) ale:~$ docker run -d busybox:1.24 sleep 1000
    54bb78983abfa518daac5ce3fe7c981d49a906a0cc0f8eed11972857ad01b24b
    (docker) ale:~$ 

## Verify the process with PS

Only we'll see running images.

    (docker) ale:~$ docker ps
    CONTAINER ID   IMAGE          COMMAND        CREATED         STATUS         PORTS     NAMES
    54bb78983abf   busybox:1.24   "sleep 1000"   3 minutes ago   Up 2 minutes             festive_noyce
    (docker) ale:~$

## Verify the list of all commands

    (docker) ale:~$ docker ps -a
    CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS                      PORTS     NAMES
    54bb78983abf   busybox:1.24   "sleep 1000"             4 minutes ago    Up 4 minutes                          festive_noyce
    1fb5494c1da4   busybox:1.24   "echo 'Hello Alejand…"   17 minutes ago   Exited (0) 17 minutes ago             naughty_turing
    71f2ab09140e   ubuntu         "bash"                   45 minutes ago   Exited (0) 45 minutes ago             condescending_galois
    1010de6409c1   hello-world    "/hello"                 50 minutes ago   Exited (0) 50 minutes ago             gallant_sinoussi
