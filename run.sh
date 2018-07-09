#!/bin/bash

if [ ! -d ~/Documents/MapBox/project ]; then
  mkdir -p ~/Documents/MapBox/project/;
fi

if [ ! -d ~/Documents/MapBox/cache ]; then
  mkdir -p ~/Documents/MapBox/cache/;
fi

if [ ! -d ~/Documents/MapBox/export ]; then
  mkdir -p ~/Documents/MapBox/export/;
fi

cd ~/Documents/MapBox/project/

wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip
unzip openstreets-nl 

wget https://ingmapping.com/openstreets-nl/openstreets-nl-rd.zip
unzip openstreets-nl 

docker run -d --name="docker-tilemill" -p 20008:20008 -p 20009:20009 -v ~/Documents/MapBox/project/:/root/Documents/MapBox/project/ -t ingmapping/tilemill




