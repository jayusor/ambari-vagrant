#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

sudo yum update -y
#sudo yum install java-1.7.0-open* -y
 

sudo yum install wget R libcurl libcurl-devel -y
# curl-devel readline-devel texlive texlive-latex texlive-texmf-fonts cairo-devel libtiff-devel libjpeg-devel -y 
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

#cd /opt/
#sudo wget http://cran.r-project.org/src/base/R-3/R-3.1.0.tar.gz
#sudo tar -xzvf R-3.1.0.tar.gz 
#cd /opt/R-3.1.0
#sudo ./configure --enable-R-shlib  --with-x=no
#sudo make
#sudo make install

#echo 'pathmunge /usr/local/bin' > /etc/profile.d/R.sh
#echo 'pathmunge /usr/jdk64/jdk1.7.0_45/bin'  > /etc/profile.d/java.sh

sudo echo 'HADOOP_CMD=/usr/bin/hadoop' >>  /etc/environment
sudo echo 'JAVA_HOME=/usr/java/jdk1.7.0_51' >>  /etc/environment
sudo echo 'HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  /etc/environment



curl -sSfL http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm --output /tmp/cdh.rpm
curl -sSfL http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera --output /tmp/cdh.key
sudo rpm --import /tmp/cdh.key
sudo yum localinstall -y -q /tmp/cdh.rpm

sudo yum install -y zookeeper-server rpm python-setuptools
sudo service zookeeper-server init
echo 1 | sudo tee -a /var/lib/zookeeper/myid >/dev/null

curl -sSfL http://downloads.mesosphere.io/master/centos/6/mesos_0.19.0_x86_64.rpm --output /tmp/mesos.rpm
sudo yum localinstall -y -q /tmp/mesos.rpm


curl -sSfL http://downloads.mesosphere.io/master/centos/6/mesos-0.19.0_rc2-py2.6.egg --output /tmp/mesos.egg
sudo easy_install --allow-hosts pypi.python.org /tmp/mesos.egg

sudo chmod 777 /etc/mesos/zk
echo "zk://c6501.ambari.apache.org:2181/mesos" > /etc/mesos/zk
sudo chmod 644 /etc/mesos/zk


sudo reboot
