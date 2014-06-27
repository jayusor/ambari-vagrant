#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/


sudo yum update -y
sudo yum install wget R libcurl libcurl-devel -y
sudo yum groupinstall 'Development Tools' -y


wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm" \
-O /opt/jdk-7-linux-x64.rpm

sudo rpm -Uvh /opt/jdk-7-linux-x64.rpm


sudo alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_51/jre/bin/java 20000
sudo alternatives --install /usr/bin/jar jar /usr/java/jdk1.7.0_51/bin/jar 20000
sudo alternatives --install /usr/bin/javac javac /usr/java/jdk1.7.0_51/bin/javac 20000
sudo alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.7.0_51/jre/bin/javaws 20000
sudo alternatives --set java /usr/java/jdk1.7.0_51/jre/bin/java
sudo alternatives --set javaws /usr/java/jdk1.7.0_51/jre/bin/javaws
sudo alternatives --set javac /usr/java/jdk1.7.0_51/bin/javac
sudo alternatives --set jar /usr/java/jdk1.7.0_51/bin/jar


sudo echo 'HADOOP_CMD=/usr/bin/hadoop' >>  /etc/environment
sudo echo 'JAVA_HOME=/usr/java/jdk1.7.0_51' >>  /etc/environment
sudo echo 'HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  /etc/environment

cd /opt/
cp /vagrant/spark-1.0.0-bin-hadoop2.tgz .
tar -xzvf spark-1.0.0-bin-hadoop2.tgz
rm spark-1.0.0-bin-hadoop2.tgz


sudo echo 'HADOOP_CONF_DIR=/etc/hadoop/conf' >>  /etc/environment
echo 'pathmunge /opt/spark-1.0.0-bin-hadoop2/bin' > /etc/profile.d/spark.sh
echo 'pathmunge /opt/spark-1.0.0-bin-hadoop2/sbin' > /etc/profile.d/spark_sh.sh


