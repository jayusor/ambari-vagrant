#!/usr/bin/env bash

sudo yum install wget -y
wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo
sudo cp ambari.repo /etc/yum.repos.d
sudo yum install ambari-server -y
sudo ambari-server setup -s
sudo ambari-server start
