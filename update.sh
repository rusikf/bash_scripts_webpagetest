set -e
cd ~/bash_scripts_webpagetest
echo 'Pull image'
docker pull webpagetest/agent
echo 'Rebuild from image'
(cd agent && docker build --no-cache -t webpagetest_agent .)
echo 'Remove old image'
docker image rm webpagetest/agent
echo 'Stop all docker containers'
docker stop $(docker ps -aq)
echo 'Start location'
./start-location.sh



