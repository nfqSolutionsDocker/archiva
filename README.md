# Archiva 2.2.0

This container has the following characteristics:
- Container centos:7.
- The archiva directory is /archiva.

For example, docker-compose.yml:
```
app:
 image: nfqsolutions/archiva:2.2.0-jdk8
 restart: always
 container_name: archiva
 ports:
  - "8085:8080"
 volumes:
  - <mydirectory>:/archiva
 
```


### Note

If you have a repositories folder backup, you can put into volumen folder in the path <mydirectory>/


### License

Using this image implies accepting Oracle's [License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).