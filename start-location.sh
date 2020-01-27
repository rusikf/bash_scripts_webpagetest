#!/bin/bash

set -e
source ./credentials.sh

echo 'Kill all docker containers'
docker kill $(docker ps -q)

echo 'Run webpagetest location instance'
docker run -d -p 4001:80 \
	   --network="host" \
	      -e "SERVER_URL=$SERVER_URL" \
	         -e "LOCATION=$LOCATION_UID" \
		    webpagetest_agent
