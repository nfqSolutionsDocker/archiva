FROM centos:7

MAINTAINER solutions@nfq.com

# Instalacion previa
RUN yum update
RUN yum -y install wget

# Instalacion java
RUN yum -y install java-1.8.0-openjdk

# Instalacion archiva
RUN wget -P / "http://archive.apache.org/dist/archiva/2.2.0/binaries/apache-archiva-2.2.0-bin.tar.gz"

RUN tar -xvzf /apache-archiva-2.2.0-bin.tar.gz -C /
RUN chmod -R 777 $(ls -d /apache-archiva*/)
RUN mv $(ls -d /apache-archiva*/) /archiva
RUN mkdir -p /archiva/repositories

# Variables de entorno
ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
	ARCHIVA_HOME=/archiva \
	ARCHIVA_VERSION=2.2.0
	
# Volumenes para el docker
VOLUME /archiva

# Puerto de salida del docker
EXPOSE 8080

ENTRYPOINT ["/archiva/bin/archiva", "console"]