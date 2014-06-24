#!/usr/bin/env bash

cd /opt/
wget http://apache.rediris.es/spark/spark-1.0.0/spark-1.0.0-bin-hadoop2.tgz
tar -xzvf spark-1.0.0-bin-hadoop2.tgz
hadoop fs -put spark-1.0.0-bin-hadoop2.tgz /tmp/
rm spark-1.0.0-bin-hadoop2.tgz

sudo echo 'HADOOP_CONF_DIR=/etc/hadoop/conf' >>  /etc/environment
echo 'pathmunge /opt/spark-1.0.0-bin-hadoop2/bin' > /etc/profile.d/spark.sh

cp /opt/spark-1.0.0-bin-hadoop2/spark-env.sh.template /opt/spark-1.0.0-bin-hadoop2/spark-env.sh
echo "export MESOS_NATIVE_LIBRARY=/usr/local/lib/libmesos.so" >> /opt/spark-1.0.0-bin-hadoop2/spark-env.sh
echo "export SPARK_EXECUTOR_URI=hdfs://c6501.ambari.apache.org/tmp/spark-1.0.0-bin-hadoop2.tgz" >> /opt/spark-1.0.0-bin-hadoop2/spark-env.sh
echo "export MASTER=mesos://c6501.ambari.apache.org:5050" >> /opt/spark-1.0.0-bin-hadoop2/spark-env.sh


#spark-submit --class org.apache.spark.examples.SparkPi  --master yarn-client   lib/spark-examples*.jar   10
#spark-shell --master yarn-client
#./bin/spark-submit --class org.apache.spark.examples.SparkPi  --master yarn-cluster  --num-executors 3  --executor-cores 1 lib/spark-examples*.jar  10
