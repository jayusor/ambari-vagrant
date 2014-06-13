#!/usr/bin/env bash

cd /opt/
wget http://apache.rediris.es/spark/spark-1.0.0/spark-1.0.0-bin-hadoop2.tgz
tar -xzvf spark-1.0.0-bin-hadoop2.tgz


sudo echo 'HADOOP_CONF_DIR=/etc/hadoop/conf' >>  /etc/environment

#./bin/spark-submit --class org.apache.spark.examples.SparkPi  --master yarn-cluster   lib/spark-examples*.jar   10

#./bin/spark-shell --master yarn-client