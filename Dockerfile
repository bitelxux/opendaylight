FROM centos:latest
MAINTAINER carlos.novo@ammeon.com

# Tell debconf to run in non-interactive mode
ENV CENTOS_FRONTEND noninteractive

RUN yum update -y
RUN yum install -y vim wget curl java-1.8.0-openjdk-headless

RUN mkdir /root/opendaylight
COPY distribution-karaf-0.6.0-Carbon.tar.gz /root/opendaylight
RUN tar xvfz /root/opendaylight/distribution-karaf-0.6.0-Carbon.tar.gz -C /root/opendaylight
RUN sed -i "21s/out/stdout/" /root/opendaylight/distribution-karaf-0.6.0-Carbon/etc/org.ops4j.pax.logging.cfg

# puppet
RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
RUN yum install -y puppet-agent
RUN /opt/puppetlabs/bin/puppet module install opendaylight-opendaylight --version 4.0.1

EXPOSE 8101
EXPOSE 1099
EXPOSE 44444

# Entry point
COPY start_karaf.sh /root/
CMD ["/root/start_karaf.sh"]

