#!/bin/bash

set -e
# Setup env variables: SERVER_URL, WPT_SERVER, WPT_UID

if [ -z "$SERVER_URL" ] || [ -z "$WPT_SERVER" ] || [ -z "$WPT_UID" ]
then
  echo "Error: ENV SERVER_URL or WPT_SERVER or WPT is empty"
  exit
fi

echo 'add root ssh key'
ssh-copy-id -i ~/.ssh/github_rsa.pub root@$SERVER_URL -o PreferredAuthentications=password -o PubkeyAuthentication=no

echo 'add deploy user'
ssh -t root@$SERVER_URL 'adduser deploy;sudo groupadd docker;sudo usermod -aG docker deploy;sudo apt-get install git;'

echo 'add deploy ssh key'
ssh-copy-id -i ~/.ssh/github_rsa.pub deploy@$SERVER_URL -o PreferredAuthentications=password -o PubkeyAuthentication=no

echo 'clone repo'
ssh -t deploy@$SERVER_URL 'cd /home/deploy && git clone https://github.com/rusikf/bash_scripts_webpagetest'

echo 'setup docker under root'
ssh -t root@$SERVER_URL '(cd /home/deploy/bash_scripts_webpagetest && ./setup-docker.sh)'

echo 'Setup location under deploy user , create credentials, start docker'
ssh -t deploy@$SERVER_URL<< HERE
  cd /home/deploy/bash_scripts_webpagetest
  echo 'Setup location'
  ./setup-location.sh
  echo 'create credentials'
  touch credentials.sh
  echo 'SERVER_URL=$WPT_SERVER' >> credentials.sh
  echo 'LOCATION_UID=$WPT_UID' >> credentials.sh
  echo 'start location'
  ./start-location.sh
HERE

echo 'Add restart wpt location to cron for prevent memory issues'
ssh -t deploy@$SERVER_URL 'cd /home/deploy/bash_scripts_webpagetest/cron && ./update-cron.sh'

echo 'Finish!, See docker ps OR docker stats in ssh'
