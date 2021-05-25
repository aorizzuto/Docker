# CMD command example

## Docker file

    FROM busybox:1.24
    RUN ls && touch ale.txt && ls
    CMD echo "This is the command when we run the image"

### Output

    (docker) ale:~/Repositorios/Docker$ sudo docker build .
    Sending build context to Docker daemon    108kB
    Step 1/3 : FROM busybox:1.24
    ---> 47bcc53f74dc
    Step 2/3 : RUN ls && touch ale.txt && ls
    ---> Using cache
    ---> 4c603e6f86d0
    Step 3/3 : CMD echo "This is the command when we run the image"
    ---> Running in 39e3eaf9ea3c
    Removing intermediate container 39e3eaf9ea3c
    ---> 59d46ea487b0
    Successfully built 59d46ea487b0

    (docker) ale:~/Repositorios/Docker$ sudo docker run 59d46ea487b0
    This is the command when we run the image

    (docker) ale:~/Repositorios/Docker$ sudo docker run 59d46ea487b0 echo "Overriding message"
    Overriding message
