#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

sudo yum update -y
#sudo yum install java-1.7.0-open* -y
 
sudo yum install java-1.7.0-open*  wget curl-devel readline-devel texlive texlive-latex texlive-texmf-fonts cairo-devel libtiff-devel libjpeg-devel -y 
sudo yum groupinstall 'Development Tools' -y

cd /opt/
sudo wget http://cran.r-project.org/src/base/R-3/R-3.1.0.tar.gz
sudo tar -xzvf R-3.1.0.tar.gz 
cd /opt/R-3.1.0
sudo ./configure --enable-R-shlib  --with-x=no
sudo make
sudo make install



#sudo yum install R curl-devel wget -y
#R CMD javareconf

sudo R -e 'update.packages(repo="http://cran.rstudio.com",ask=F)' 
sudo R -e 'install.packages(c("data.table","devtools","rJava"),repo="http://cran.rstudio.com")'

echo 'HADOOP_CMD=/usr/bin/hadoop' >>  /etc/environment
echo 'HADOOP_STREAMING=/usr/lib/hadoop-mapreduce/hadoop-streaming.jar' >>  /etc/environment


#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rmr2", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhdfs", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhbase", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("plyrmr", "RevolutionAnalytics",subdir="pkg")'
