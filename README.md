### archiva

This container has the following characteristics:
- Container nfqsolutions/centos:7.
- The java directory is /solutions/app/java.
- The tomcat directory is /solutions/app/tomcat.
- Installations script of archiva in centos. This script is executing in the next containers or in the docker compose.

For example, docker-compose.yml:
```
app:
 image: nfqsolutions/archiva:2.2.0-jdk8
 restart: always
 container_name: archiva-2.2.0
 ports:
  - "8080:8085"
 environment:
  - PACKAGES=
 volumes:
  - <mydirectory>:/solutions/app
 
```


### License

Using this image implies accepting Oracle's [License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).