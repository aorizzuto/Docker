# None network

1) Run the image

    (docker) ale:~/Repositorios/Docker$ docker run -d --net none busybox sleep 1000
    1953d618c70ea7552ac340487f8b20577960a7ca9e5d2c4266aa0ed1088b2e9e

2) Exec shell in the imagen and ping Google public DNS. There is no responde because None network is not reaching outside world

    (docker) ale:~/Repositorios/Docker$ docker exec -it 1953d618c70ea7552ac340487f8b20577960a7ca9e5d2c4266aa0ed1088b2e9e /bin/ash
    / # ping 8.8.8.8
    PING 8.8.8.8 (8.8.8.8): 56 data bytes
    ping: sendto: Network is unreachable
    / # ifconfig
    lo        Link encap:Local Loopback  
            inet addr:127.0.0.1  Mask:255.0.0.0
            UP LOOPBACK RUNNING  MTU:65536  Metric:1
            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
            collisions:0 txqueuelen:1000
            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

    / # exit

3) Make ping from PC terminal and works

    (docker) ale:~/Repositorios/Docker$ ping 8.8.8.8
    PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
    64 bytes from 8.8.8.8: icmp_seq=1 ttl=116 time=13.6 ms
    64 bytes from 8.8.8.8: icmp_seq=2 ttl=116 time=10.9 ms
    64 bytes from 8.8.8.8: icmp_seq=3 ttl=116 time=10.3 ms
    64 bytes from 8.8.8.8: icmp_seq=4 ttl=116 time=12.2 ms
    64 bytes from 8.8.8.8: icmp_seq=5 ttl=116 time=10.3 ms
    64 bytes from 8.8.8.8: icmp_seq=6 ttl=116 time=10.1 ms
    ^C
    --- 8.8.8.8 ping statistics ---
    15 packets transmitted, 15 received, 0% packet loss, time 14020ms
    rtt min/avg/max/mdev = 9.484/13.242/49.008/9.610 ms

4) Stop image

    (docker) ale:~/Repositorios/Docker$ docker ps
    CONTAINER ID   IMAGE     COMMAND        CREATED         STATUS         PORTS     NAMES
    1953d618c70e   busybox   "sleep 1000"   2 minutes ago   Up 2 minutes             recursing_jackson

    (docker) ale:~/Repositorios/Docker$ docker stop 1953d618c70e
    1953d618c70e

    (docker) ale:~/Repositorios/Docker$ docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
