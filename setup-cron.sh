#/bin/bash

servers=()

for i in "${servers[@]}"
do
   echo $i
   ssh -t deploy@$i 'cd /home/deploy/bash_scripts_webpagetest && git checkout master && git pull; cd cron; ./update-cron.sh'
done
