# Inspect command

We'll use the "inspect" command to check an specific docker container with its ID.

    (docker) ale:~$ docker inspect 47bcc5....
    [
        {
            "Id": "47bcc5....",
            "Created": "2021-05-24T19:19:21.093971441Z",
            "Path": "sleep",
            "Args": [
                "1000"
            ],
            "State": {
                "Status": "running",
                "Running": true,
                ...
                "Error": "",
                "StartedAt": "2021-05-24T19:19:22.543467872Z",
                "FinishedAt": "0001-01-01T00:00:00Z"
            },
            "Image": "sha256:47bcc5....",
            ...
            "AppArmorProfile": "docker-default",
            "ExecIDs": null,
            "HostConfig": {
                "Binds": null,
                "ContainerIDFile": "",
                "LogConfig": {
                    ...
                },
                "NetworkMode": "default",
                "PortBindings": {},
                "RestartPolicy": {
                    ...
                },
                "AutoRemove": false,
                "VolumeDriver": "",
                "VolumesFrom": null,
                "CapAdd": null,
                "CapDrop": null,
                ...
                "ConsoleSize": [
                    0,
                    0
                ],
                "Isolation": "",
                "CpuShares": 0,
                "Memory": 0,
                "NanoCpus": 0,
                ...
                "CpuPercent": 0,
                "IOMaximumIOps": 0,
                "IOMaximumBandwidth": 0,
                "MaskedPaths": [
                    ...
                ],
                "ReadonlyPaths": [
                    ...
                ]
            },
            "GraphDriver": {
                "Data": {
                    ...
                },
                "Name": "overlay2"
            },
            "Mounts": [],
            "Config": {
                ...
                "Domainname": "",
                "User": "",
                "AttachStdin": false,
                "AttachStdout": false,
                "AttachStderr": false,
                "Tty": false,
                "OpenStdin": false,
                "StdinOnce": false,
                "Env": null,
                "Cmd": [
                    "sleep",
                    "1000"
                ],
                "Image": "busybox:1.24",
                "Volumes": null,
                "WorkingDir": "",
                "Entrypoint": null,
                "OnBuild": null,
                "Labels": {}
            },
            "NetworkSettings": {
                "Bridge": "",
                ...
                "LinkLocalIPv6Address": "",
                ...
                "Ports": {},
                ...
                "SecondaryIPAddresses": null,
                "SecondaryIPv6Addresses": null,
                ...
                "GlobalIPv6Address": "",
                ...
                "IPv6Gateway": "",
                ...
                "Networks": {
                    "bridge": {
                        ...
                    }
                }
            }
        }
    ]
