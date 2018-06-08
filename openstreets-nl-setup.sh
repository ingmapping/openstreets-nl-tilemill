#!/bin/bash


if [ ! -d ~/Documents/MapBox/project ]; then
  mkdir -p ~/Documents/MapBox/project/;
fi

cd ~/Documents/MapBox/project/

wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip
unzip openstreets-nl openstreets-nl




