# Host network

1) Create a host container

        (docker) ale:~$ docker run -d --name container_4 --net host busybox sleep 1000
        6b5a60feb20ab5be3eee242128c0c19c508595c259811ecb1c0c482df5de487d

2) Check ifconfig to see the ip configuration

        (docker) ale:~$ docker exec -it container_4 ifconfig
        br-bc15837b865c Link encap:Ethernet  
                inet addr:172.18.0.1  Bcast:172.18.255.255  Mask:255.255.0.0
                UP BROADCAST MULTICAST  MTU:1500  Metric:1
                RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                TX packets:128 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:0 (0.0 B)  TX bytes:18617 (18.1 KiB)

        docker0   Link encap:Ethernet   
                inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
                UP BROADCAST MULTICAST  MTU:1500  Metric:1
                RX packets:17 errors:0 dropped:0 overruns:0 frame:0
                TX packets:172 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:1148 (1.1 KiB)  TX bytes:25859 (25.2 KiB)

        enp7s0    Link encap:Ethernet 
                inet addr:192.168.0.17  Bcast:192.168.0.255  Mask:255.255.255.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:443482 errors:0 dropped:2 overruns:0 frame:0
                TX packets:159998 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000 
                RX bytes:543305273 (518.1 MiB)  TX bytes:25645870 (24.4 MiB)

        lo        Link encap:Local Loopback  
                inet addr:127.0.0.1  Mask:255.0.0.0
                inet6 addr: ::1/128 Scope:Host
                UP LOOPBACK RUNNING  MTU:65536  Metric:1
                RX packets:6455 errors:0 dropped:0 overruns:0 frame:0
                TX packets:6455 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000 
                RX bytes:613081 (598.7 KiB)  TX bytes:613081 (598.7 KiB)
