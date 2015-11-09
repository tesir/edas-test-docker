# This dockerfile build edas test env for zcy.
# VERSION 0.1
# Author: chenjun

FROM ubuntu:14.04

MAINTAINER chenjun <chenj@dtdream.com>

# Update sources
RUN echo "deb http://mirrors.163.com/ubuntu precise main universe"> /etc/apt/sources.list
RUN apt-get update

# Install ssh
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN echo "root:DtDream0209" | chpasswd

# Install curl
RUN apt-get install -y curl

# Install jdk8
RUN cd /opt && curl 'http://121.40.73.27/tools/jdk-8u65-linux-x64.tar.gz' | tar -xz

# Install alitocat
RUN cd /usr/local && curl 'http://121.40.73.27/tools/taobao-tomcat-7.0.59.tar.gz' |tar -xz

# Install maven
ENV MAVEN_VERSION 3.3.3
RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV JAVA_HOME /opt/jdk1.8.0_65
ENV PATH $JAVA_HOME/bin:$PATH

VOLUME ["/workspace"]

EXPOSE 22
EXPOSE 8080
