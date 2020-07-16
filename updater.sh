#!/bin/bash
set -e
scp update.sh $SSH:~/bash_scripts_webpagetest
ssh $SSH '(cd ~/bash_scripts_webpagetest && ./update.sh > update.log 2>&1 &)'

