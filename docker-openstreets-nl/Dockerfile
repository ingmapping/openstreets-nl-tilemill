FROM ubuntu:16.04
MAINTAINER ingmapping <contact@ingmapping.com>

# Ensure `add-apt-repository` is present
RUN apt-get update -y \
    && apt-get install -y software-properties-common python-software-properties

# Install dependencies 
RUN apt-get update -y \
    && apt-get install -y libboost-all-dev git-core tar unzip wget bzip2 build-essential autoconf libtool libxml2-dev libgeos-dev libgeos++-dev libpq-dev libbz2-dev libproj-dev munin-node munin libprotobuf-c0-dev protobuf-c-compiler libfreetype6-dev libpng12-dev libtiff5-dev libicu-dev libgdal-dev libcairo-dev libcairomm-1.0-dev apache2 apache2-dev libagg-dev liblua5.2-dev ttf-unifont lua5.1 liblua5.1-dev libgeotiff-epsg postgresql-client-9.5 

# Install mapnik library
RUN apt-get install -y autoconf apache2-dev libtool libxml2-dev libbz2-dev libgeos-dev libgeos++-dev libproj-dev gdal-bin libgdal1-dev libmapnik-dev mapnik-utils python-mapnik

# Verify that Mapnik has been installed correctly
RUN python -c 'import mapnik'

# Install openstreets-nl stylesheets and shapefiles 
RUN mkdir ~/src && cd ~/src \
    && wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip \
    && unzip openstreets-nl \
    && find ~/src/ \( -type f -iname "*.zip" -o -iname "*.tgz" \) -delete

# Make local directory for exporting tiles    
RUN mkdir /data
VOLUME /data

# Install necessary fonts for openstreets-nl style
RUN apt-get install -y ttf-ubuntu-font-family ttf-dejavu 

# Entrypoint and instructions 
COPY ./docker-entrypoint.sh /docker-entrypoint.sh 
RUN chmod a+rx /docker-entrypoint.sh 

COPY ./openstreets-nl.xml /root/src/openstreets-nl/openstreets-nl.xml
COPY ./generate_tiles.py /root/src/openstreets-nl/generate_tiles.py   
COPY ./index.html /root/src/openstreets-nl/index.html   

ENV MIN_ZOOM=0
ENV MAX_ZOOM=16

ENTRYPOINT /docker-entrypoint.sh





