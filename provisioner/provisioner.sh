#!/bin/bash

# ------------------------------------------------------------------------
# Copyright 2018 Pinuno (http://ww.pinuno.com.gh)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
# ------------------------------------------------------------------------

# This script acts as the machine provisioner during the Vagrant box build process for MySQL database, Apache 2, PHP 5.6  and GIT.

# set variables
DB_PASSWORD=pinuno
WORKING_DIRECTORY=/home/vagrant

# set and export environment variables
export DEBIAN_FRONTEND=noninteractive
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set MySQL root password configuration using debconf
echo debconf mysql-server/root_password password $DB_PASSWORD | \
  sudo debconf-set-selections
echo debconf mysql-server/root_password_again password $DB_PASSWORD | \
  sudo debconf-set-selections

# run package updates
apt-get update

# install mysql
apt-get -y install mysql-server

# set the bind address from loopback address to all IPv4 addresses of the host
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf

# restart the MySQL server
service mysql restart

#install sendmail
apt-get install -y sendmail

#configure sendmail
sudo sendmailconfig -y

# run package updates
apt-get update

# install apache
apt-get install -y apache2


# prepare and install PHP 5 and necessary extensions
sudo add-apt-repository ppa:ondrej/php

# run package updates
apt-get update

sudo apt-get install -y php7.2 php5.6 php5.6-mysql php5.6-gettext php5.6-mbstring php5.6-xdebug libapache2-mod-php5.6 php5.6-mcrypt php5.6-gd php5.6-curl php5.6-soap php5.6-simplexml

# disable php 7
sudo a2dismod php7.2 

# enable php 5
# sudo a2enmod php5.6

# run package updates
apt-get update

# install git and unzip
sudo apt-get install -y git-core unzip
# run package updates
apt-get update


# restart apache2 service
service apache2 restart

# install composer
curl -sS https://getcomposer.org/installer -o composer-setup.php

# remove the APT cache
apt-get clean

# clear the bash history and exit
cat /dev/null > ${WORKING_DIRECTORY}/.bash_history && history -c
