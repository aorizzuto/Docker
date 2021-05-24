# Tomcat imagen from public registry Docker Hub

    (docker) ale:~$ docker run -it -p 8888:8080 tomcat:9.0

To check our tomcat server, we need to go to "localhost:8888" and we'll see it running

    (docker) ale:~$ docker ps -a
    CONTAINER ID   IMAGE          COMMAND                  CREATED             STATUS                            PORTS     NAMES
    af7c5ba4e107   tomcat:9.0     "catalina.sh run"        8 minutes ago       Exited (130) About a minute ago             happy_elgamal
    54bb78983abf   busybox:1.24   "sleep 1000"             40 minutes ago      Exited (0) 24 minutes ago                   festive_noyce
    039c8f2db875   busybox:1.24   "sh"                     50 minutes ago      Exited (0) 49 minutes ago                   vigorous_margulis

## Run tomcat server in background and check logs

    (docker) ale:~$ docker run -it -d -p 8888:8080 tomcat:9.0
    0f845fc90c3b673628b948663850101c175a2ef1a07053d6ad1401867beed87f

    (docker) ale:~$ docker logs 0f845fc90c3b673628b948663850101c175a2ef1a07053d6ad1401867beed87f
    Using CATALINA_BASE:   /usr/local/tomcat
    Using CATALINA_HOME:   /usr/local/tomcat
    ...
    24-May-2021 20:02:36.819 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version name:   Apache Tomcat/9.0.46
    24-May-2021 20:02:36.821 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server built:          May 8 2021 17:35:52 UTC
    24-May-2021 20:02:36.821 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log Server version number: 9.0.46.0
    24-May-2021 20:02:36.821 INFO [main] org.apache.catalina.startup.VersionLoggerListener.log OS Name:               Linux
    ...
    24-May-2021 20:02:37.202 INFO [main] org.apache.coyote.AbstractProtocol.init Initializing ProtocolHandler ["http-nio-8080"]
    24-May-2021 20:02:37.238 INFO [main] org.apache.catalina.startup.Catalina.load Server initialization in [624] milliseconds
    24-May-2021 20:02:37.292 INFO [main] org.apache.catalina.core.StandardService.startInternal Starting service [Catalina]
    24-May-2021 20:02:37.293 INFO [main] org.apache.catalina.core.StandardEngine.startInternal Starting Servlet engine: [Apache Tomcat/9.0.46]
    24-May-2021 20:02:37.304 INFO [main] org.apache.coyote.AbstractProtocol.start Starting ProtocolHandler ["http-nio-8080"]
    24-May-2021 20:02:37.317 INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [78] milliseconds
