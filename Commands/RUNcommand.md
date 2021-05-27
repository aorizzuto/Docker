# Run Docker image from public registry

RUN = CREATE + START

    docker run busybox:1.24 echo "Hello Alejandro!"

    Unable to find image 'busybox:1.24' locally
    1.24: Pulling from library/busybox
    Image docker.io/library/busybox:1.24 uses outdated schema1 manifest format. Please upgrade to a schema2 image for better future compatibility. More information at https://docs.docker.com/registry/spec/deprecated-schema-v1/
    385e281300cc: Pull complete 
    a3ed95caeb02: Pull complete 
    Digest: sha256:8ea3273d79b47a8b6d018be398c17590a4b5ec604515f416c5b797db9dde3ad8
    Status: Downloaded newer image for busybox:1.24

    Hello Alejandro!
