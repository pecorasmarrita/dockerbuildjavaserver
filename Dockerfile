FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa -y
RUN apt-get update
RUN echo "mysql-server mysql-server/root_password password root" |  debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" |  debconf-set-selections
RUN apt-get install -y mysql-server
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y openjdk-11-jdk
RUN apt-get install -y maven
RUN apt-get install -y git
COPY buildscript.sh /root/
RUN chmod +x /root/buildscript.sh
CMD /root/buildscript.sh
