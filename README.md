# OpenStreetsNL Tilemill project

A TileMill/CartoCSS project for creating custom styled raster tiles. 

![alt text](https://github.com/ingmapping/openstreets-nl-tilemill/blob/master/demo.gif)

[View Demo](https://ingmapping.xyz/tileserver/openstreets_nl/index.html)


## Introduction  

This project is part of an internship assignment which aimed at creating tiled basemaps for the KNMI geospatial infrastructure. The data and tools used to create the openstreets-nl basemap are open-source. Therefore, this project is reproducible for everyone who wants to create simple basemaps (raster tiled basemaps) from free vector data! This repository contains all the necessary instructions and files to create your own custom styled raster tiles. 

### OpenStreetsNL style and shapefiles
The openstreets-nl style example is based on a CartoCSS style and open data from OpenStreetMap and Natural Earth. The openstreets-nl-tilemill project is based on individual shapefiles, which means that there is no need for connecting a PostGIS database with the Tilemill project. The tilemill project for the openstreets-nl style in [EPSG:3857](https://epsg.io/3857) projection including the relevant shapefiles can be downloaded [here](https://ingmapping.com/openstreets-nl/openstreets-nl.zip). The tilemill project for the openstreets-nl-rd style in [EPSG:28992](https://epsg.io/28992) projection including the relevant shapefiles can be downloaded [here](https://ingmapping.com/openstreets-nl/openstreets-nl-rd.zip). 

Shapefile original data sources:
* airports.shp: Contains the shapes of the aiports in the Netherlands. The original data source was the BBG2012 data set  (Bestand Bodemgebruik 2012) which contains information regarding the land use in the Netherlands. More information on the BBG2012 can be found [here](https://data.overheid.nl/data/dataset/bestand-bodemgebruik-2012-shape-file).
* ne_10m_ocean.shp: Contains ocean polygons from Natural Earth vector data which can be found [here](https://www.naturalearthdata.com/downloads/10m-physical-vectors/10m-ocean/). [Note: not used in openstreets-nl-rd style].
* nederland.shp: Contains the shape of the Netherlands. It was used here to display the shape of the nNetherlands for zoom level at lower zoom levels. It was obtained from the 10m-admin-0-countries Natural Earth data set by performing a selection in QGIS and exporting it into a shapefile. More information on the original dataset can be found [here](https://www.naturalearthdata.com/downloads/10m-cultural-vectors/10m-admin-0-countries/). 
* osm_nl.shp. Contains OpenStreetMap polygon and land boundary for the Netherlands. It was used here for the shape of the Netherlands and boundary at higher zoom levels. The original data source comes from an [osm extract by wambachers-osm.website](https://wambachers-osm.website/boundaries/). Please note that this dataset was used for boundaries of the Netherlands because  earlier attempts with Natural Earth datasets produced borders which did not match well with the osm datasets. 
* land_polygons.shp. Contains polygons for all land areas in the world. The original shapefiles can be downloaded [here](http://data.openstreetmapdata.com/land-polygons-complete-4326.zip) from openstreetmapdata.com. Please note that this dataset was used for shapes of the world at lower zoom levels because earlier attempts with Natural Earth datasets did not match well with the osm datasets. [Note: not used in openstreets-nl-rd style].
* osm_landuse.shp: Contains OpenStreetMap land use data for the Netherlands. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* osm_places.shp: Contains OpenStreetMap place names data for the Netherlands. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* osm_roads.shp: Contains OpenStreetMap roads data for the Netherlands. The OpenStreetMap roads dataset has been clipped with the data set of the Netherlands (with geoprocessing tools in ArcMap or QGIS). The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf). 
* osm_water.shp: Contains OpenStreetMap water data for the Netherlands. The OpenStreetMap water dataset has been clipped with the data set of the Netherlands (with geoprocessing tools in ArcMap or QGIS). The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf).
* osm_railways.shp: Contains railway information for the Netherlands. It was used here for displaying the railtracks in the Netherlands on certain zoom levels. The original data source comes from an [extract by Geofabrik](http://download.geofabrik.de/europe/netherlands.html). The original shapefiles can be downloaded [here](http://download.geofabrik.de/europe/netherlands-latest-free.shp.zip). More information on the OpenStreetMap shapefiles can be found [here](http://download.geofabrik.de/osm-data-in-gis-formats-free.pdf)
* countries.shp: Contains information about world countries and shapes. The dataset used can be downloaded [here](http://mapbox-geodata.s3.amazonaws.com/natural-earth-1.4.0/cultural/10m-admin-0-countries.zip). [Note: only used for openstreets-nl-rd].

Order of the layers in openstreets-nl Tilemill project (see project.mml):
* nederland-label (nederland.shp)
* osmplaces (osm_places.shp)
* osmroads-label (osm_roads.shp)
* osmnlboundary (osm_nl.shp)
* airports (airports.shp)
* osmrailways (osm_railways.shp)
* osmroads (osm_roads.shp)
* osmlanduse (osm_landuse.shp)
* osmwater (osm_water.shp)
* osmnl (osm_nl.shp)
* nederland (nederland.shp)
* world (land_polygons.shp)
* ne10ocean (ne_10m_ocean.shp)

Order of the layers in openstreets-nl-rd Tilemill project (see project.mml):
* nederland-label (nederland.shp)
* osmplaces (osm_places.shp)
* osmroads-label (osm_roads.shp)
* osmnlboundary (osm_nl.shp)
* airports (airports.shp)
* osmrailways (osm_railways.shp)
* osmroads (osm_roads.shp)
* osmlanduse (osm_landuse.shp)
* osmwater (osm_water.shp)
* osmnl (osm_nl.shp)
* nederland (nederland.shp)
* countries (countries.shp)

### Tilemill

TileMill is a design environment developed by MapBox for cartography, constituting Mapnik as a renderer, CartoCSS as a stylesheet language, and a locally-served web interface with node.js as a server and based on Backbone.js for the client. Tilemill allows you to:

* Use existing projects as a starting point 
* Define styling rules with CartoCSS which define layer colours and visibility
* Export maps in image format or as a package of raster tiles in mbtiles format

More information: https://wiki.openstreetmap.org/wiki/TileMill and https://github.com/tilemill-project/tilemill.

In this openstreets-nl-tilemill repository instructions are given on how to set-up tilemill and openstreets-nl with Docker (by running Tilemill inside a docker container) or without using Docker by manually installing tilemill from source.

## Tilemill set up

### Set up openstreets-nl and Tilemill with Docker 

How to build the image:

```
docker build -t ingmapping/tilemill git://github.com/ingmapping/docker-tilemill
```

or 

```
docker pull ingmapping/tilemill
```

To run the container with tilemill and openstreets-nl:

```
git clone https://github.com/ingmapping/openstreets-nl-tilemill.git
cd openstreets-nl-tilemill
./run.sh
```

To use the container, open your browser at:

```
http://localhost:20009
```

The run.sh script contains instructions to run tilemill with port 20008 and 20009 port exposed using -p 20008:20008 -p 20009:20009 and instructions to mount your project directory using -v argument, namely:

```
docker run -d --name="docker-tilemill" -p 20008:20008 -p 20009:20009 -v ~/Documents/MapBox/project/:/root/Documents/MapBox/project/ -t ingmapping/tilemill
```

More information on how to use docker-tilemill: https://github.com/ingmapping/docker-tilemill. 

### Set up openstreets-nl and Tilemill manually from source

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

To download the shapefiles and openstreets-nl styles into the layers sub-directory:

```
    wget https://ingmapping.com/openstreets-nl/openstreets-nl.zip
    unzip openstreets-nl
```

or for openstreets-nl-rd (projection EPSG:28892):


```
    wget https://ingmapping.com/openstreets-nl/openstreets-nl-rd.zip
    unzip openstreets-nl-rd
```


The tilemill project should be in inside the your tilemill project directory:

    ~/Documents/MapBox/project/

Now go start TileMill and you should see the project available.

## Exporting your basemap/raster tiles

Inside Tilemill you can choose to export the project as MBTiles. Once the export is done (this can take a while), [MBUtil](https://github.com/mapbox/mbutil) can be used to export the MBTiles into a directory structure.

How to export your tiles into a directory structure with MButil:

```
    git clone https://github.com/ingmapping/openstreets-nl-tilemill.git
    cd openstreets-nl-tilemill/mbutil
    ./mb-util --image_format=png openstreets-nl.mbtiles openstreets-nl-tiles
```
More information on MBUtil can be found on the original MBUtil repository: https://github.com/mapbox/mbutil. 

## Viewing your basemap/raster tiles

Once that you have your tiles exported in a folder directory structure, you can view the generated raster tiles using various JavaScript mapping libraries. For example:

* [Leaflet JS](https://leafletjs.com/) is a lightweight open source JavaScript library for building interactive web maps.

```js
	L.tileLayer('file:////PATH-TO-YOUR-TILES-DIRECTORY-HERE/{z}/{x}/{y}.png', {
		minZoom: 5, maxZoom: 16,
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors | <a href="https://github.com/ingmapping/openstreets-nl-tilemill/"> openstreets-nl</a> project - <a href="https://www.ingmapping.com">ingmapping.com</a>'
	}).addTo(map);
```
[Leaflet JS - demo](https://ingmapping.xyz/tileserver/openstreets_nl/index.html).
