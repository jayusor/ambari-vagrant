#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

sudo yum update -y yum install R curl-devel -y
sudo R -e 'update.packages(repo="http://cran.rstudio.com",ask=F)' R -e 
sudo R -e 'install.packages(c("devtools),repo="http://cran.rstudio.com")'

#'install.packages(c("devtools","Rcpp","RJSONIO","bitops","digest","functional","reshape2","stringr","plyr","caTools"),repo="http://cran.rstudio.com")' 
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rmr2", "RevolutionAnalytics",subdir="pkg")'
#sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhdfs", "RevolutionAnalytics",subdir="pkg")'

