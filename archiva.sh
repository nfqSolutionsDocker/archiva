#!/bin/bash

/solutions/install_packages.sh

echo Instalando java ...
if [ ! -f /solutions/app/java/bin/java ]; then
	wget -P /solutions/app/ --no-cookies --no-check-certificate --header \
    	"Cookie: oraclelicense=accept-securebackup-cookie" \
    	"http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}-b14/jdk-${JAVA_VERSION}-linux-x64.tar.gz"
	tar -xvzf /solutions/app/jdk-${JAVA_VERSION}-linux-x64.tar.gz -C /solutions/app/
	chmod -R 777 $(ls -d /solutions/app/jdk*/)
	ln -sf $(ls -d /solutions/app/jdk*/) /solutions/app/java
fi

echo Instalando archiva ...
if [ ! -f /solutions/app/archiva/bin/archiva ]; then
	wget -P /solutions/app/ "http://archive.apache.org/dist/archiva/2.2.0/binaries/apache-archiva-2.2.0-bin.tar.gz"
	tar -xvzf /solutions/app/apache-archiva-${JAVA_VERSION}-bin.tar.gz -C /solutions/app/
	chmod -R 777 $(ls -d /solutions/app/apache-archiva*/)
	ln -sf $(ls -d /solutions/app/apache-archiva*/) /solutions/app/archiva
	mkdir -p /solutions/app/archiva/repositories
fi

/solutions/app/archiva/bin/archiva console