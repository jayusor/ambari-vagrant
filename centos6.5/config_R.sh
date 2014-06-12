#!/usr/bin/env bash

sudo R CMD javareconf

sudo R -e 'update.packages(repo="http://cran.rstudio.com",ask=F)' 
sudo R -e 'install.packages(c("data.table","devtools","rJava"),repo="http://cran.rstudio.com")'
sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhdfs", "RevolutionAnalytics",subdir="pkg")'
sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhbase", "RevolutionAnalytics",subdir="pkg")'
sudo R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("plyrmr", "RevolutionAnalytics",subdir="pkg")'


