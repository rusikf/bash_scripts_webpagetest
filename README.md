Install new webpagetest location on new vps:
  1) Change SERVER_URL in setup.sh and run setup.sh locally
  2) Connect to ssh, change credentials.sh, run ./start-location.sh

  3) Optional - add to cron task to restart docker every 2 hours ( to prevent memory issues )
