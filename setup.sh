#!/bin/bash

set -e
SERVER_URL=''

echo 'add root ssh key'
ssh-copy-id -i ~/.ssh/github_rsa.pub root@$SERVER_URL -o PreferredAuthentications=password -o PubkeyAuthentication=no

echo 'add deploy user'
ssh -t root@$SERVER_URL 'adduser deploy;sudo groupadd docker;sudo usermod -aG docker deploy;'

echo 'add deploy ssh key'
ssh-copy-id -i ~/.ssh/github_rsa.pub deploy@$SERVER_URL -o PreferredAuthentications=password -o PubkeyAuthentication=no

echo 'clone repo'
ssh -t deploy@$SERVER_URL 'cd /home/deploy && git clone https://github.com/rusikf/bash_scripts_webpagetest'

echo 'setup docker under root'
ssh -t root@$SERVER_URL '(cd /home/deploy/bash_scripts_webpagetest && ./setup-docker.sh)'

echo 'setup location under deploy user'
ssh -t deploy@$SERVER_URL '(cd /home/deploy/bash_scripts_webpagetest && ./setup-location.sh)'

echo 'Finish! Please change credentials.sh and run ./start-location.sh and add to cron for autorestart location'
