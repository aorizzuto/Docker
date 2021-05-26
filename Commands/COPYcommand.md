# Use of COPY command in Docker

First, we create a empty file in our local computer

    (docker) ale:~/Repositorios/Docker$ touch emptyFile.txt

Secondly, we modify out Dockerfile

    FROM busybox:1.24
    RUN ls && touch ale.txt && echo && ls
    COPY ./emptyFile.txt /

After this, we need to build our Dockerfile

    (docker) ale:~/Repositorios/Docker$ sudo docker build .
    Sending build context to Docker daemon  123.4kB
    Step 1/3 : FROM busybox:1.24
    ---> 47bcc53f74dc
    Step 2/3 : RUN ls && touch ale.txt && ls
    ---> Using cache
    ---> 9d69c068e2a1
    Step 3/3 : COPY ./emptyFile.txt /
    ---> fa15d89b8910
    Successfully built fa15d89b8910

Finally, run the image and verify the copy command functionality

    (docker) ale:~/Repositorios/Docker$ docker run -it fa15d89b8910
    / # ls
    ale.txt        dev            etc            proc           sys            usr
    bin            emptyFile.txt  home           root           tmp            var
