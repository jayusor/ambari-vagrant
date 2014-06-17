#!/usr/bin/env bash

cd /opt/
wget http://apache.rediris.es/spark/spark-1.0.0/spark-1.0.0-bin-hadoop2.tgz
tar -xzvf spark-1.0.0-bin-hadoop2.tgz
rm spark-1.0.0-bin-hadoop2.tgz

sudo echo 'HADOOP_CONF_DIR=/etc/hadoop/conf' >>  /etc/environment
echo 'pathmunge /opt/spark-1.0.0-bin-hadoop2/bin' > /etc/profile.d/spark.sh

sudo echo 'MASTER=yarn-client' >>  /etc/environment


#spark-submit --class org.apache.spark.examples.SparkPi  --master yarn-client   lib/spark-examples*.jar   10
#spark-shell --master yarn-client

./bin/spark-submit --class org.apache.spark.examples.SparkPi  --master yarn-cluster  --num-executors 3  --executor-cores 1 lib/spark-examples*.jar  10
