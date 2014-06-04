#!/usr/bin/env bash

adduser user
passwd user

su hdfs
hadoop fs -mkdir /user/user
hadoop fs -chown -R user:user /user/user
exit
 
su user
echo 'export HADOOP_CMD=/usr/bin/hadoop' >>  ~/.bash_profile
echo 'export HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  ~/.bash_profile
source ~/.bash_profile
hadoop  jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar  pi 10 10
exit

