# Run tomcat server in background and check logs

    (docker) ale:~$ docker run -it -d -p 8888:8080 tomcat:9.0
    0f845fc90c3b673628b948663850101c175a2ef1a07053d6ad1401867beed87f

Checking logs:

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
