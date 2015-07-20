#!/bin/bash
## @see http://www.chrisle.me/2013/08/running-headless-selenium-with-chrome/

SHELL=/bin/bash
SCRIPT_PATH=/vagrant/assets/scripts

set -e

if [ -e /.installed ]; then
  echo 'Already installed.'

else
  echo ''
  echo 'INSTALLING'
  echo '----------'

  # @see https://about.gitlab.com/downloads/
  sudo debconf-set-selections <<< "postfix postfix/mailname string phpci.local"
  sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Local only'"
  sudo apt-get -y -qq install curl openssh-server ca-certificates postfix gdebi
  curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

  if [ ! -e /vagrant/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb ]; then
    cd /tmp && wget https://packages.gitlab.com/gitlab/gitlab-ce/packages/ubuntu/trusty/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb/download \
            && mv /tmp/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb /vagrant
  fi;

  sudo gdebi -n /vagrant/gitlab-ce_7.12.2~omnibus.1-1_amd64.deb
  sudo mkdir -p /etc/gitlab
  sudo cp /vagrant/gitlab.rb /etc/gitlab
  sudo gitlab-ctl reconfigure

  # So that running `vagrant provision` doesn't redownload everything
  sudo touch /.installed
fi