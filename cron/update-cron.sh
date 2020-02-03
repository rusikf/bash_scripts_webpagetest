#!/bin/bash
cron -e
crontab cron-file
echo 'Cron updated'
crontab -l
