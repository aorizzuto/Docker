# Network command

## To create a network

    (docker) ale:~$ docker network create --driver bridge my_bridge_network
    bc15837b865c97cb15f1a3d62480c919fc045e1f4e2e215ac1302191416e46d7

## To check the network

    (docker) ale:~$ docker network ls
    NETWORK ID     NAME                DRIVER    SCOPE
    7c9a778d310c   bridge              bridge    local
    d5ad496e7480   host                host      local
    bc15837b865c   my_bridge_network   bridge    local
    f093d22c2cf2   none                null      local

## To inspect the network

    (docker) ale:~$ docker network inspect my_bridge_network 
    [
        {
            "Name": "my_bridge_network",
            "Id": "bc15837b865c97cb15f1a3d62480c919fc045e1f4e2e215ac1302191416e46d7",
            "Created": "2021-05-26T11:49:14.452440861-03:00",
            "Scope": "local",
            "Driver": "bridge",
            "EnableIPv6": false,
            "IPAM": {
                "Driver": "default",
                "Options": {},
                "Config": [
                    {
                        "Subnet": "172.18.0.0/16",
                        "Gateway": "172.18.0.1"
                    }
                ]
            },
            "Internal": false,
            "Attachable": false,
            "Ingress": false,
            "ConfigFrom": {
                "Network": ""
            },
            "ConfigOnly": false,
            "Containers": {},
            "Options": {},
            "Labels": {}
        }
    ]

## To connect a container to a bridge

    (docker) ale:~$ docker network connect bridge container_name

## To disconnect a container from bridge

    (docker) ale:~$ docker network disconnect bridge container_name
