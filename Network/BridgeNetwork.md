# Bridge network

1) Run the image

        (docker) ale:~/Repositorios/Docker$ docker run -d --name container_1 busybox sleep 1000
        500cc947c089e22cff7942bf110b6686dbf5907d046ddbd64eb565dba4efc6c4

2) Exec ifconfig in the container to check the networks

    We see two networks:

        * Ethernet -> Bridge
        * Loopback -> None

        (docker) ale:~$ docker exec -it container_1 ifconfig
        eth0      Link encap:Ethernet  
                inet addr:172.17.0.2  Bcast:172.17.255.255  Mask:255.255.0.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:57 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:7712 (7.5 KiB)  TX bytes:0 (0.0 B)

        lo        Link encap:Local Loopback  
                inet addr:127.0.0.1  Mask:255.0.0.0
                UP LOOPBACK RUNNING  MTU:65536  Metric:1
                RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000 
                RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

3) Create a new container "container_2"

        (docker) ale:~$ docker run -d --name container_2 busybox sleep 1000
        3e01cbffa5cfe56dc4a019740f50c935a53facb8cb8eaabbff141bb044f43a36

4) Exec ifconfig in the container_2 to check the networks

    We see that this eth0 network is located in 172.17.0.3, so it's connected with the previous container because it's in the range of IPs.

        (docker) ale:~$ docker exec -it container_2 ifconfig
        eth0      Link encap:Ethernet 
                inet addr:172.17.0.3  Bcast:172.17.255.255  Mask:255.255.0.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:16 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0
                RX bytes:2170 (2.1 KiB)  TX bytes:0 (0.0 B)

        lo        Link encap:Local Loopback  
                inet addr:127.0.0.1  Mask:255.0.0.0
                UP LOOPBACK RUNNING  MTU:65536  Metric:1
                RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000 
                RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

5) To show how the containers are connected, we ping one container from the other one.

        (docker) ale:~$ docker exec -it container_1 ping 172.17.0.3
        PING 172.17.0.3 (172.17.0.3): 56 data bytes
        64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.130 ms
        64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.090 ms
        64 bytes from 172.17.0.3: seq=2 ttl=64 time=0.088 ms
        64 bytes from 172.17.0.3: seq=3 ttl=64 time=0.089 ms
        64 bytes from 172.17.0.3: seq=4 ttl=64 time=0.095 ms
        64 bytes from 172.17.0.3: seq=5 ttl=64 time=0.067 ms
        ^C
        --- 172.17.0.3 ping statistics ---
        6 packets transmitted, 6 packets received, 0% packet loss
        round-trip min/avg/max = 0.067/0.093/0.130 ms

6) Also we can ping Google public DNS within the container

        (docker) ale:~$ docker exec -it container_1 ping 8.8.8.8
        PING 8.8.8.8 (8.8.8.8): 56 data bytes
        64 bytes from 8.8.8.8: seq=0 ttl=115 time=10.588 ms
        64 bytes from 8.8.8.8: seq=1 ttl=115 time=10.940 ms
        64 bytes from 8.8.8.8: seq=2 ttl=115 time=10.836 ms
        ^C
        --- 8.8.8.8 ping statistics ---
        3 packets transmitted, 3 packets received, 0% packet loss
        round-trip min/avg/max = 10.588/10.788/10.940 ms

7) Create a container_3 from my own network

        (docker) ale:~$ docker run -d --name container_3 --net my_bridge_network busybox sleep 1000
        640542a7725a6b9f40d5704a2664bd4632b170b6e84127d05ef7b50e6a384e56

8) Get the IP from container_3

        (docker) ale:~$ docker exec -it container_3 ifconfig
        eth0      Link encap:Ethernet  
                inet addr:172.18.0.2  Bcast:172.18.255.255  Mask:255.255.0.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:57 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:7712 (7.5 KiB)  TX bytes:0 (0.0 B)

        lo        Link encap:Local Loopback  
                inet addr:127.0.0.1  Mask:255.0.0.0
                UP LOOPBACK RUNNING  MTU:65536  Metric:1
                RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000
                RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

9) Ping container 3 from container 1

    We see that we loss all packages, that's because container 3 is in another IP range that container 1

        (docker) ale:~$ docker exec -it container_1 ping 172.18.0.2
        PING 172.18.0.2 (172.18.0.2): 56 data bytes
        ^C
        --- 172.18.0.2 ping statistics ---
        9 packets transmitted, 0 packets received, 100% packet loss

10) Connect the container_3 to the bridge

        (docker) ale:~$ docker network connect bridge container_3

11) Look the ifconfig for container_3 again

        (docker) ale:~$ docker exec -it container_3 ifconfig
        eth0      Link encap:Ethernet  
                inet addr:172.18.0.2  Bcast:172.18.255.255  Mask:255.255.0.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:90 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:11631 (11.3 KiB)  TX bytes:0 (0.0 B)

        eth1      Link encap:Ethernet 
                inet addr:172.17.0.4  Bcast:172.17.255.255  Mask:255.255.0.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:48 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:5949 (5.8 KiB)  TX bytes:0 (0.0 B)

        lo        Link encap:Local Loopback  
                inet addr:127.0.0.1  Mask:255.0.0.0
                UP LOOPBACK RUNNING  MTU:65536  Metric:1
                RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000 
                RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

12) Ping container 3 from container 1 again and we'll see that are connected to each other

        (docker) ale:~$ docker exec -it container_1 ping 172.17.0.4
        PING 172.17.0.4 (172.17.0.4): 56 data bytes
        64 bytes from 172.17.0.4: seq=0 ttl=64 time=0.175 ms
        64 bytes from 172.17.0.4: seq=1 ttl=64 time=0.097 ms
        64 bytes from 172.17.0.4: seq=2 ttl=64 time=0.122 ms
        64 bytes from 172.17.0.4: seq=3 ttl=64 time=0.095 ms
        64 bytes from 172.17.0.4: seq=4 ttl=64 time=0.098 ms
        64 bytes from 172.17.0.4: seq=5 ttl=64 time=0.082 ms
        ^C
        --- 172.17.0.4 ping statistics ---
        6 packets transmitted, 6 packets received, 0% packet loss
        round-trip min/avg/max = 0.082/0.111/0.175 ms

13) Disconnect container_3

        (docker) ale:~$ docker network disconnect bridge container_3

14) See ifconfig again to verify the disconnection

        (docker) ale:~$ docker exec -it container_3 ifconfig
        eth0      Link encap:Ethernet  HWaddr 02:42:AC:12:00:02  
                inet addr:172.18.0.2  Bcast:172.18.255.255  Mask:255.255.0.0
                UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
                RX packets:132 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:0 
                RX bytes:17758 (17.3 KiB)  TX bytes:0 (0.0 B)

        lo        Link encap:Local Loopback  
                inet addr:127.0.0.1  Mask:255.0.0.0
                UP LOOPBACK RUNNING  MTU:65536  Metric:1
                RX packets:0 errors:0 dropped:0 overruns:0 frame:0
                TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
                collisions:0 txqueuelen:1000 
                RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
