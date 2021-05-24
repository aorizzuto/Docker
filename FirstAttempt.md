# First steps in Docker

(docker) ale:~$ docker images

    REPOSITORY    TAG       IMAGE ID       CREATED        SIZE

(docker) ale:~$ docker run busybox:1.24 echo "Hello Alejandro!"

    Unable to find image 'busybox:1.24' locally
    1.24: Pulling from library/busybox
    Image docker.io/library/busybox:1.24 uses outdated schema1 manifest format. Please upgrade to a schema2 image for better future compatibility. More information at https://docs.docker.com/registry/spec/deprecated-schema-v1/
    385e281300cc: Pull complete 
    a3ed95caeb02: Pull complete 
    Digest: sha256:8ea3273d79b47a8b6d018be398c17590a4b5ec604515f416c5b797db9dde3ad8
    Status: Downloaded newer image for busybox:1.24
    Hello Alejandro!

(docker) ale:~$ docker images

    REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
    busybox       1.24      47bcc53f74dc   5 years ago    1.11MB

(docker) ale:~$ docker run busybox:1.24 echo "Hello Alejandro!"

    Hello Alejandro!

(docker) ale:~$ docker run -i -t busybox:1.24

    / # ls
    bin   dev   etc   home  proc  root  sys   tmp   usr   var
    / # cd dev
    /dev # pwd
    /dev
    /dev # touch a.txt
    /dev # ls
    a.txt    core     full     null     pts      shm      stdin    tty      zero
    console  fd       mqueue   ptmx     random   stderr   stdout   urandom
    /dev # exit

Once we exit, the container ill be shutdown. If we run same command, Docker will create a new container and our file "a.txt" won't exist anymore.
