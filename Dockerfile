FROM centos:latest
MAINTAINER carlos.novo@ammeon.com

# Tell debconf to run in non-interactive mode
ENV CENTOS_FRONTEND noninteractive

RUN yum update -y
RUN yum install -y vim wget curl java-1.8.0-openjdk-headless

RUN mkdir /root/opendaylight
COPY distribution-karaf-0.6.0-Carbon.tar.gz /root/opendaylight
RUN tar xvfz /root/opendaylight/distribution-karaf-0.6.0-Carbon.tar.gz -C /root/opendaylight

# Expose ports
#EXPOSE 443
#EXPOSE 80

# Entry point
CMD /bin/bash

