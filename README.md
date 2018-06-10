# OpenstreetsNL Tilemill project

A TileMill/CartoCSS project for creating custom styled raster tiles

## Introduction  

This project is part of an internship assignment which aimed at creating tiled basemaps for the KNMI geospatial infrastructure. The data and tools used to create the openstreets-nl basemap are open-source. Therefore, this project is reproducible for everyone who wants to create simple basemaps (raster tiled basemaps) from free vector data! This repository contains all the necessary instructions and files to create your own custom styled raster tiles. 

### OpenstreetsNL style and shapefiles
The openstreets-nl style example is based on a CartoCSS style and open data from OpenStreetMap and Natural Earth. The openstreets-nl-tilemill project is based on individual shapefiles, which means that there is no need for connecting a PostGIS database with the Tilemill project. The openstreets-nl-tilemill including the relevant shapefiles can be downloaded [here](https://ingmapping.com/openstreets-nl/openstreets-nl.zip).


To download the styles and shapefiles:

```
    wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip
```

Shapefile original sources:
* airports.shp: Contains the shapes of the aiports in the Netherlands. The original data source was the BBG2012 data set  (Bestand Bodemgebruik 2012) which contains information regarding the land use in the Netherlands. More information on the BBG2012 can be found [here](https://data.overheid.nl/data/dataset/bestand-bodemgebruik-2012-shape-file).
* BAG-panden.shp: Contains the shapes of buildings in the Netherlands. The original data source was the BAG (Basisregistraties Adressen en Gebouwen) data set which contains information of adresses and buildings in the Netherlands. The data was downloaded by exporting the features from a WFS endpoint into a shapefile with QGIS. More information on how to do this [here](http://pdok-ngr.readthedocs.io/downloaden.html). More information on the BAG data set can be found [here](https://data.overheid.nl/data/dataset/basisregistratie-adressen-en-gebouwen--bag-).
* BAG-Woonplaatsgrenzen.shp: Contains the shapes of the residence borders in the Netherlands. The original data can be downloaded [here](http://www.imergis.nl/shp/BAG-Woonplaatsgrenzen-shp.zip). It was an extract from the BAG (Basisregistraties Adressen en Gebouwen). More information on the BAG data set can be found [here](https://data.overheid.nl/data/dataset/basisregistratie-adressen-en-gebouwen--bag-). More information on BAG extract can be found [here](https://www.kadaster.nl/-/bag-extract). 
* ne_10m_admin_0_countries.shp: Contains data about world countries and boundaries. The original data source comes from Natural Earth which can be found [here](https://www.naturalearthdata.com/downloads/10m-cultural-vectors/10m-admin-0-countries/).
* ne_10m_ocean.shp: Contains ocean polygons from Natural Earth vector data which can be found [here](https://www.naturalearthdata.com/downloads/10m-physical-vectors/10m-ocean/).
* nederland.shp: Contains the shape of the Netherlands. It was obtained from the 10m-admin-0-countries Natural Earth data set by performing a selection in QGIS and exporting it into a shapefile. More information on the original dataset can be found [here](https://www.naturalearthdata.com/downloads/10m-cultural-vectors/10m-admin-0-countries/). 
* osm_landuse.shp: Contains OpenStreetMap land use data for the Netherlands. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* osm_places.shp: Contains OpenStreetMap place names data for the Netherlands. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here] (http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* osm_roads.shp: Contains OpenStreetMap roads data for the Netherlands. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* osm_water.shp: Contains OpenStreetMap water data for the Netherlands. It is a copy of osm_roads.shp for displaying roads labels on certains zoom levels. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* railtracks.shp: Contains railway information for the Netherlands. It was used here for displaying the railtracks in the Netherlands on certain zoom levels. The original data can be downloaded [here](http://www.imergis.nl/shp/Top10NL_Spoor-shp.zip). It is an extract from the [TOP10NL data set](https://data.overheid.nl/data/dataset/top10nl). Please note that the original data set was converted with  from local RD (EPSG:28992) CRS to the WGS84 coordinate system (EPSG:4326) for use with the Web Mercator projection (EPSG:3857). You can do this with [GDAL ogr2ogr](http://www.gdal.org/ogr2ogr.html) or inside QGIS by setting the layer CRS to WGS84 and exporting the layers as a new shapefile. 
    
### Tilemill

TileMill is a design environment developed by MapBox for cartography, constituting Mapnik as a renderer, CartoCSS as a stylesheet language, and a locally-served web interface with node.js as a server and based on Backbone.js for the client. Tilemill allows you to:

* Use existing projects as a starting point 
* Define styling rules with CartoCSS which define layer colours and visibility
* Export maps in image format or as a package of raster tiles in mbtiles format

More information: https://wiki.openstreetmap.org/wiki/TileMill and https://github.com/tilemill-project/tilemill.

In this openstreets-nl-tilemill repository instructions are given on how to set-up tilemill and openstreets-nl with Docker (by running Tilemill inside a docker container) or without using Docker by manually installing tilemill from source.

## Tilemill set up

### Set up Tilemill with Docker (docker-tilemill)

How to build the image:

```
docker build -t ingmapping/tilemill git://github.com/ingmapping/docker-tilemill
```

or 

```
docker pull ingmapping/tilemill
```

To run you must expose 20008 and 20009 port using -p 20008:20008 -p 20009:20009. How to run the container:

```
docker run --name="docker-tilemill" -p 20008:20008 -p 20009:20009 -d -t ingmapping/tilemill
```
To use your local projects you cant mount your project direcotry using -v argument. How to mount your local ~/Documents/Mapbox in the container in order to work on data from your local filesystem: 

```
docker run -d --name="docker-tilemill" -p 20008:20008 -p 20009:20009 -v ~/Documents/MapBox/project/:/root/Documents/MapBox/project/ -t ingmapping/tilemill
```

To use the container, open your browser at:

```
http://localhost:20009
```

### Tilemill manual installation from source

To install from source just do:
```
    git clone https://github.com/tilemill-project/tilemill.git
    cd tilemill
    npm install
```
Then to start TileMill do:

As a Desktop application:
```
    ./index.js 
```
To run the **web version** pass `server=true`: 
```
    ./index.js --server=true
```
and then go to `localhost:20009` in your web browser

#### Download shapefiles and styles

Option 1: You can download the shapefiles and styles by running the openstreets-nl-setup.sh script. This creates the project directory at ~/Documents/MapBox/project/openstreets-nl. 

```
    git clone https://github.com/ingmapping/openstreets-nl-tilemill.git
    ./openstreets-nl-setup.sh
```
Now go start TileMill and you should see the project available.

Option 2: Another way is to download the shapefiles and styles into the layers sub-directory:

```
    wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip
    unzip openstreets-nl.zip openstreets-nl
```

Now copy or link the project subdirectory called 'openstreets-nl' into
your TileMill projects directory at:

    ~/Documents/MapBox/project/

You can make a symlink like:

    ln -s `pwd`/openstreets-nl ~/Documents/MapBox/project/openstreets-nl

Now go start TileMill and you should see the project available.

## Exporting your basemap/raster tiles

Inside Tilemill choose to export the project as MBTiles. Once the export is done (this can take a while), [MBUtil](https://github.com/mapbox/mbutil) can be used to export the MBTiles into a directory structure.

How to export your tiles into a directory structure with MButil:

```
    git clone https://github.com/ingmapping/openstreets-nl-tilemill.git
    cd mbutil
    ./mb-util --image_format=png openstreets-nl.mbtiles openstreets-nl-tiles
```
More information on MBUtil can be found on the original MBUtil repository: https://github.com/mapbox/mbutil. 

## Viewing your basemap/raster tiles

You use the pre-generated tiled basemaps using various JavaScript mapping libraries. For example:

* [Leaflet JS](https://leafletjs.com/) is a lightweight open source JavaScript library for building interactive web maps.

```js
	L.tileLayer('PATH-TO-YOUR-DIRECTORY-HERE/{z}/{x}/{y}.png', {
		minZoom: 5, maxZoom: 16,
		attribution: '<a href="https://github.com/ingmapping/openstreets-nl-tilemill/">Basemap created with Tilemill</a> - <a href="https:// 	www.ingmapping.com">ingmapping.com</a>'
	}).addTo(map);
```
[Leaflet JS - demo](https://tileserver.ingmapping.com/openstreets_nl/demo.html).
