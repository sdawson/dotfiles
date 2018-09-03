#!/bin/bash

# Cleanup unused images
docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs docker rmi

# Cleanup containers
docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v

# Cleanup unused volumes
docker volume ls -qf dangling=true | xargs docker volume rm
