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
#sudo ln -s /usr/local/bin/* /usr/bin/
echo 'pathmunge /usr/local/bin' > /etc/profile.d/R.sh
#echo 'pathmunge /usr/jdk64/jdk1.7.0_45/bin'  > /etc/profile.d/java.sh

sudo echo 'HADOOP_CMD=/usr/bin/hadoop' >>  /etc/environment
sudo echo 'JAVA_HOME=/usr' >>  /etc/environment
sudo echo 'HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  /etc/environment


curl -sSfL http://archive.cloudera.com/cdh4/one-click-install/redhat/6/x86_64/cloudera-cdh-4-0.x86_64.rpm --output /tmp/cdh.rpm
curl -sSfL http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera --output /tmp/cdh.key
sudo rpm --import /tmp/cdh.key
sudo yum localinstall -y -q /tmp/cdh.rpm

sudo yum install -y java-1.7.0-openjdk zookeeper-server rpm python-setuptools
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
