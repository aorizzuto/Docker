# Use of cache in Docker

## First time

    (docker) ale:~/Repositorios/Docker$ sudo docker build .

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

## Second time

We can see that the second time is running faster and say "using cache"

    (docker) ale:~/Repositorios/Docker$ sudo docker build .

    Sending build context to Docker daemon  119.3kB
    Step 1/3 : FROM busybox:1.24
    ---> 47bcc53f74dc
    Step 2/3 : RUN ls && touch ale.txt && ls
    ---> Using cache
    ---> 4c603e6f86d0
    Step 3/3 : CMD echo "This is the command when we run the image"
    ---> Using cache
    ---> 59d46ea487b0
    Successfully built 59d46ea487b0

## Third time

Using "--no-cache=true"

    (docker) ale:~/Repositorios/Docker$ sudo docker build . --no-cache=true

    Sending build context to Docker daemon  121.3kB
    Step 1/3 : FROM busybox:1.24
    ---> 47bcc53f74dc
    Step 2/3 : RUN ls && touch ale.txt && echo && ls
    ---> Running in b5a9d4d7c0d6
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
    Removing intermediate container b5a9d4d7c0d6
    ---> 9d69c068e2a1
    Step 3/3 : CMD echo "This is the command when we run the image"
    ---> Running in 3a051e9132b9
    Removing intermediate container 3a051e9132b9
    ---> 1e8b4fc4ac76
    Successfully built 1e8b4fc4ac76
