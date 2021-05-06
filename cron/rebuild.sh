#! /bin/bash
set -e
mkdir -p /home/deploy/cron_logs && (/home/deploy/bash_scripts_webpagetest/rebuild.sh >> /home/deploy/cron_logs/weekly-rebuild-to-cleanup-space.log 2>&1)


