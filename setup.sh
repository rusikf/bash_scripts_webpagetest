#!/bin/bash
set -e

echo 'Setup script - Run it under root'

source add-user-sh
source setup-docker.sh

mv /root/bash_scripts_webpagetest /home/deploy/

echo 'OK, next - add ssh key for deploy user'
echo 'And on deploy user run setup-location.sh, start-location.sh from deploy user'
# TODO: login on deploy and run scripts
