#!/bin/bash

set -e

docker run -d -p 4001:80 \
	   --network="host" \
	      -e "SERVER_URL=$SERVER_URL" \
	         -e "LOCATION=$LOCATION_UID" \
		    webpagetest_agent
