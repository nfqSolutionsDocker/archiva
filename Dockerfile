FROM centos:7

MAINTAINER solutions@nfq.es

RUN yum install -y java-1.8.0-openjdk.x86_64

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk \
    ARCHIVA_HOME=/archiva \
    PATH=$PATH:$ARCHIVA_HOME/bin:$JAVA_HOME/bin

RUN echo "export ARCHIVA_HOME=/archiva" >> ~/.bashrc
RUN echo "export PATH=\$PATH:\$ARCHIVA_HOME/bin" >> ~/.bashrc

COPY archiva-resources/apache-archiva-2.2.0 /archiva
RUN mkdir -p /archiva/repositories && \
    mkdir -p /archiva/logs && \
    mkdir -p /archiva/temp && \
    mkdir -p /archiva/repositories
RUN chmod -R 777 /archiva

EXPOSE 8085

VOLUME /archiva/repositories

#CMD ["/bin/bash"]
CMD ["/archiva/bin/archiva", "console"]