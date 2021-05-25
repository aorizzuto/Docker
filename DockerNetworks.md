# Docker Networks

There are four types:

* Closed / None Network
* Bridge Network
* Host Network
* Overlay Network

## To check the networks

    (docker) ale:~/Repositorios/Docker$ sudo docker network ls

    NETWORK ID     NAME      DRIVER    SCOPE
    3e6e48796fcd   bridge    bridge    local
    d5ad496e7480   host      host      local
    f093d22c2cf2   none      null      local

_________________________

## None network

Does not have any access to the outside world.
