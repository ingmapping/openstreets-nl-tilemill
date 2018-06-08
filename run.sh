#!/bin/bash

if [ ! -d ~/Documents/MapBox/project ]; then
  mkdir -p ~/Documents/MapBox/project/;
fi

cd ~/Documents/MapBox/project/

wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip
unzip openstreets-nl -d openstreets-nl

docker run -d --name="docker-tilemill" -p 20008:20008 -p 20009:20009 -v ~/Documents/MapBox/project/:/root/Documents/MapBox/project/ -t ingmapping/tilemill




