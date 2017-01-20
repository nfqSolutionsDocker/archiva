FROM alpine:3.4

MAINTAINER solutions@nfq.es

RUN apk update && \
    apk add --no-cache curl \
    ca-certificates \
    openjdk7-jre

ENV TOMCAT_VERSION=7.0.67

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/ca-certificates.crt \
  "https://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
    | gunzip \
    | tar x -C /usr/ \
    && mv /usr/apache-tomcat* /usr/tomcat \
    && rm -rf /usr/tomcat/webapps/examples /usr/tomcat/webapps/docs && \
    mkdir /usr/tomcat/archiva

COPY archiva-resources/archiva.xml /usr/tomcat/conf/Catalina/localhost/archiva.xml

# SET CATALINE_HOME and PATH
ENV CATALINA_HOME=/usr/tomcat \
    JAVA_HOME=/usr/lib/jvm/java-1.7-openjdk/ \
    CATALINA_OPTS="-Dappserver.home=$CATALINA_HOME -Dappserver.base=$CATALINA_HOME"
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

VOLUME /usr/tomcat/archiva/

CMD ["/usr/tomcat/bin/catalina.sh", "run"]