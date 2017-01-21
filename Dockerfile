FROM centos:7

MAINTAINER solutions@nfq.es

RUN yum install -y java-1.8.0-openjdk.x86_64

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk \
    ARCHIVA_HOME=/archiva \
    PATH=$PATH:$ARCHIVA_HOME/bin:$JAVA_HOME/bin

COPY archiva-resources/apache-archiva /archiva
RUN mkdir -p /archiva/repositories && \
    mkdir -p /archiva/logs \
    mkdir -p /archiva/tmp
RUN chmod -R 777 /archiva

EXPOSE 8085

VOLUME /usr/tomcat/archiva/

#CMD ["/bin/bash"]
CMD ["/archiva/bin/archiva", "console"]