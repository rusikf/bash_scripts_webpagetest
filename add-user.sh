#!/bin/bash
set -e

adduser deploy
groupadd docker
usermod -aG docker deploy
