#!/bin/bash
set -e

# TODO: rewrite this script without mv and git clone in root

echo 'Setup script - Run it under root'

source add-user.sh
source setup-docker.sh

mv /root/bash_scripts_webpagetest /home/deploy/

echo 'OK, next - add ssh key for deploy user'
echo 'And on deploy user run setup-location.sh, start-location.sh from deploy user'

echo 'Setup locaton script - Running under deploy user'
su - deploy
source setup-location.sh
echo 'Finish: Add credentials to credentials.sh and run ./start-location.sh under deploy user'

