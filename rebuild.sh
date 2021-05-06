set -e
echo 'Pull webpagetest agent location locked version'
DIGEST="sha256:6cb22718d2c5824b5fa25268c4acb2d00d4bef0a1932cc63a014cb049ef35965"
docker pull "webpagetest/agent@$DIGEST"
echo 'build docker image from agent folder'
(cd agent && docker build --no-cache -t webpagetest_agent .)
echo 'stop docker images'
docker kill $(docker ps -q) || true
echo 'Start location'
./start-location.sh
echo 'Remove images without containers'
docker system prune -af

