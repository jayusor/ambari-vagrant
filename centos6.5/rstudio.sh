#!/usr/bin/env bash


sudo yum install libcrypto.so.6  openssl098e-0.9.8e pango-1.28.1  -y
sudo yum install  atlas blas compat-libgfortran-41  libgfortran cups dbus desktop-file-utils libXmu libicu poppler-utils portreserve tcl tk tmpwatch xdg-utils -y


wget http://download2.rstudio.org/rstudio-server-0.98.507-x86_64.rpm
sudo rpm -Uvh --nodeps rstudio-server-0.98.507-x86_64.rpm
sudo rstudio-server start
sudo rm rstudio*.rpm


