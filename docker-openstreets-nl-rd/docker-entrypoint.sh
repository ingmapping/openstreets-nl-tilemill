#!/bin/bash


export MAPNIK_MAP_FILE=~/src/openstreets-nl-rd/openstreets-nl-rd.xml
export MAPNIK_TILE_DIR=/data/tiles
mkdir -p ${MAPNIK_TILE_DIR}
chmod -R 777 ${MAPNIK_TILE_DIR}

# Copy viewer to data folder 
echo "`date +"%Y-%m-%d %H:%M:%S"` Copying leaflet viewer to export data/tiles folder "
cp /root/src/openstreets-nl-rd/index-rd.html /data/tiles

# Generate openstreets-nl tiles
echo "`date +"%Y-%m-%d %H:%M:%S"` Generating openstreets-nl-rd tiles in data/tiles folder"
python /root/src/openstreets-nl-rd/generate-tiles-rd.py --style=/root/src/openstreets-nl-rd/openstreets-nl-rd.xml --dir=${MAPNIK_TILE_DIR} --minzoom=${MIN_ZOOM} --maxzoom=${MAX_ZOOM}
