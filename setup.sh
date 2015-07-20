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
  sudo apt-get -y -qq install curl openssh-server ca-certificates postfix
  curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
  sudo apt-get -y -qq install gitlab-ce
  sudo mkdir -p /etc/gitlab
  sudo cp /vagrant/gitlab.rb /etc/gitlab
  sudo gitlab-ctl reconfigure

  # So that running `vagrant provision` doesn't redownload everything
  sudo touch /.installed
fi