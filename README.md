# Archiva 2.2.0

This container has the following characteristics:
- Container nfqsolutions/centos:7.
- The java directory is /solutions/app/java.
- The archiva directory is /solutions/app/archiva.
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


### Note

If you have a repositories folder backup, you can put into volumen folder in the path <mydirectory>/archiva/


### License

Using this image implies accepting Oracle's [License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).