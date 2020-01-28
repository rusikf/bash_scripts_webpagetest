#!/bin/bash

set -e
echo '--Install original docker agent container'
docker pull webpagetest/agent

echo 'build customized agent from ./agent folder'
cd agent && (docker build --no-cache -t webpagetest_agent .)

docker image rm webpagetest/agent
docker image rm hello-world

echo 'Copy credentials, please see credentials.sh'
cp credentials-sample.sh credentials.sh
