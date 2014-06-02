#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

sudo yum update -y 
sudo yum install R curl-devel wget -y

sudo R -e 'update.packages(repo="http://cran.rstudio.com",ask=F)' 
sudo R -e 'install.packages(c("data.table","devtools"),repo="http://cran.rstudio.com")'

#sudo HADOOP_CMD=/usr/bin/hadoop
#sudo export 
echo 'HADOOP_CMD=/usr/bin/hadoop' >>  /etc/environment
echo 'HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  /etc/environment






#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rmr2", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhdfs", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhbase", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("plyrmr", "RevolutionAnalytics",subdir="pkg")'


#hadoop: /usr/bin/hadoop /etc/hadoop /usr/lib/hadoop /usr/share/man/man1/hadoop.1.gz
