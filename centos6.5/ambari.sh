#!/usr/bin/env bash

sudo yum install wget -y
wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo
sudo mv ambari.repo /etc/yum.repos.d
sudo yum install ambari-server -y
sudo ambari-server setup
echo "client.api.port=5050" >> /etc/ambari-server/conf/ambari.properties
sudo ambari-server start


## SPARK CLUSTER

echo "c6501.ambari.apache.org" > /opt/spark-1.0.0-bin-hadoop2/conf/slaves
echo "c6502.ambari.apache.org" >> /opt/spark-1.0.0-bin-hadoop2/conf/slaves

sudo echo 'MASTER=spark://c6501.ambari.apache.org:7077' >>  /etc/environment
