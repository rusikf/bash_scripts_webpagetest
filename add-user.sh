#!/bin/bash

adduser deploy
groupadd docker
usermod -aG docker deploy

