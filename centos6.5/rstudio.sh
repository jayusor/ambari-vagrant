#!/usr/bin/env bash

wget http://download2.rstudio.org/rstudio-server-0.98.507-x86_64.rpm
sudo yum install --nogpgcheck rstudio-server-0.98.507-x86_64.rpm -y
sudo rstudio-server start
sudo rm rstudio*.rpm