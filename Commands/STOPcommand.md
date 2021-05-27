# Stop Docker container

We need the container ID first or the name.

    (docker) ale:~$ sudo docker stop 0f845fc90c3b673628b948663850101c175a2ef1a07053d6ad1401867beed87f
    0f845fc90c3b673628b948663850101c175a2ef1a07053d6ad1401867beed87f

    (docker) ale:~$ sudo docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

This will call the SIGTERM signal and it will take 10 seconds to finish.

**NOTE: See KILL command.**
