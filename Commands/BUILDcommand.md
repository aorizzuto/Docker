# Build command to build Docker files

## Docker file 1

    FROM busybox:1.24
    RUN ls
    RUN touch ale.txt
    RUN ls

### Command

    (docker) ale:~/Repositorios/Docker$ sudo docker build .

### Output

    Sending build context to Docker daemon  105.5kB
    Step 1/4 : FROM busybox:1.24
    ---> 47bcc53f74dc
    Step 2/4 : RUN ls
    ---> Running in 1e7f4f5e41a9
    bin
    dev
    etc
    home
    proc
    root
    sys
    tmp
    usr
    var
    Removing intermediate container 1e7f4f5e41a9
    ---> 25c2afd05630
    Step 3/4 : RUN touch ale.txt
    ---> Running in 0f0776a42e04
    Removing intermediate container 0f0776a42e04
    ---> c4d110e4dadd
    Step 4/4 : RUN ls
    ---> Running in a23564ba0c85
    ale.txt
    bin
    dev
    etc
    home
    proc
    root
    sys
    tmp
    usr
    var
    Removing intermediate container a23564ba0c85
    ---> 02ca4af4c8ab
    Successfully built 02ca4af4c8ab

____________________________

## Docker file 2

To reduce image layers we can use:

    FROM busybox:1.24
    RUN ls && touch ale.txt && ls

### Command

    (docker) ale:~/Repositorios/Docker$ sudo docker build .

### Output

    Sending build context to Docker daemon  106.5kB
    Step 1/2 : FROM busybox:1.24
    ---> 47bcc53f74dc
    Step 2/2 : RUN ls && touch ale.txt && echo && ls
    ---> Running in dd21c15ca03e
    bin
    dev
    etc
    home
    proc
    root
    sys
    tmp
    usr
    var

    ale.txt
    bin
    dev
    etc
    home
    proc
    root
    sys
    tmp
    usr
    var
    Removing intermediate container dd21c15ca03e
    ---> 4c603e6f86d0
    Successfully built 4c603e6f86d0
