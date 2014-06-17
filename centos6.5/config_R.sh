#!/usr/bin/env bash

R CMD javareconf

R -e 'update.packages(repo="http://cran.rstudio.com",ask=F)' 
R -e 'install.packages(c("data.table","devtools","rJava"),repo="http://cran.rstudio.com")'
R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rhdfs", "RevolutionAnalytics",subdir="pkg")'
R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("rmr2", "RevolutionAnalytics",subdir="pkg")'
R -e 'options(repos=structure(c(CRAN="http://cran.rstudio.com")));devtools::install_github("plyrmr", "RevolutionAnalytics",subdir="pkg")'


