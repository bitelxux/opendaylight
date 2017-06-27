FROM centos:latest
MAINTAINER carlos.novo@ammeon.com

# Tell debconf to run in non-interactive mode
ENV CENTOS_FRONTEND noninteractive

RUN yum update -y
RUN yum install -y java-1.8.0-openjdk-headless


# puppet
RUN rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
RUN yum install -y puppet-agent
RUN /opt/puppetlabs/bin/puppet module install opendaylight-opendaylight --version 4.0.1
COPY puppet/odl.pp /tmp/
RUN /opt/puppetlabs/bin/puppet apply /tmp/odl.pp 

EXPOSE 8101
EXPOSE 8181
EXPOSE 1099
EXPOSE 2550
EXPOSE 44444

# Entry point
CMD ["bash"]

