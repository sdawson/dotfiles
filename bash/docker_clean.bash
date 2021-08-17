#!/bin/bash

while getopts b flag
do
  case "${flag}" in
    b) boom=true;;
  esac
done

if [ "$boom" = true ]
then
  docker kill $(docker ps -q)
  docker rm $(docker ps --filter=status=exited --filter=status=created -q)
  docker rmi $(docker images -a -q)
else
  # Cleanup unused images
  docker images --no-trunc | grep '<none>' | awk '{ print $3 }' | xargs docker rmi

  # Cleanup containers
  docker ps --filter status=dead --filter status=exited -aq | xargs docker rm -v

  # Cleanup unused volumes
  docker volume ls -qf dangling=true | xargs docker volume rm
fi
