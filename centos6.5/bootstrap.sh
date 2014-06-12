#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

sudo yum update -y
#sudo yum install java-1.7.0-open* -y
 

sudo yum install wget curl-devel readline-devel texlive texlive-latex texlive-texmf-fonts cairo-devel libtiff-devel libjpeg-devel -y 
sudo yum groupinstall 'Development Tools' -y

cd /opt/
sudo wget http://cran.r-project.org/src/base/R-3/R-3.1.0.tar.gz
sudo tar -xzvf R-3.1.0.tar.gz 
cd /opt/R-3.1.0
sudo ./configure --enable-R-shlib  --with-x=no
sudo make
sudo make install
sudo ln -s /usr/local/bin/* /usr/bin/


sudo echo 'HADOOP_CMD=/usr/bin/hadoop' >>  /etc/environment
sudo echo 'JAVA_HOME=/usr/jdk64/jdk1.7.0_45/bin' >>  /etc/environment
sudo echo 'HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  /etc/environment

