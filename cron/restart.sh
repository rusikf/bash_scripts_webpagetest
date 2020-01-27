#! /bin/bash
set -e
docker restart $(docker ps -a -q)

