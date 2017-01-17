FROM centos:7
MAINTAINER https://github.com/tripleonard/sqlcmd-docker
#
RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget openssl e2fsprogs krb5-libs glibc
#
WORKDIR /root
COPY . .
#
RUN msodbcsql-13.0.0.0/build_dm.sh --accept-warning
RUN cd /tmp/unixODBC*/unixODBC-2.3.1; make install
RUN cd /root/msodbcsql-13.0.0.0/; ./install.sh install --accept-license
