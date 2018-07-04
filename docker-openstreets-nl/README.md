# Docker openstreets-nl

Generating openstreets-nl raster tiles with Mapnik and Docker! 

Related project: [openstreets-nl-tilemill](https://github.com/ingmapping/openstreets-nl-tilemill/).

<img src="https://github.com/ingmapping/openstreets-nl-tilemill/blob/master/demo.gif" width="250">

[View demo of openstreets-nl basemap](https://tileserver.ingmapping.com/openstreets_nl/demo.html)

## Introduction  

This project is part of an internship assignment which aimed at creating tiled basemaps for the KNMI geospatial infrastructure. The data and tools used to create the openstreets-nl basemap are open-source. Therefore, this project is reproducible for everyone who wants to create simple basemaps (raster tiled basemaps) from free vector data! This repository contains all the necessary instructions and files to generate openstreets-nl tiles with Mapnik and a generate_tiles.py script inside a docker container. 

The openstreets-nl basemap style was based on the [openstreets-nl-tilemill](https://github.com/ingmapping/openstreets-nl-tilemill/) project where OpenStreetMap/Natural Earth data was used to create custom styled raster tiles with CartoCSS/Tilemill. Instead of using Tilemill to create the tiles, this directory contains instructions to generate customized openstreets-nl tiles with Mapnik generate_tiles.py script inside a docker container. 

## How to set up docker-openstreets-nl 

Can be built from the Dockerfile:

```
docker build -t ingmapping/docker-openstreets-nl github.com/ingmapping/docker-openstreets-nl.git
```

or pulled from Docker Hub:

```
docker pull ingmapping/docker-openstreets-nl
```

## How to run docker-openstreets-nl 

To run the container, replace 'pwd' by your current working directory (the directory where you want the tiles to be exported) and use the following command:

```
docker run -i -t --rm --name docker-openstreets-nl -v 'pwd'/:/data ingmapping/docker-openstreets-nl
```

The above command will generate openstreets-nl tiles for zoomlevel 0 to 16 (it can take a while) in a folder called 'tiles'. If you want to generate openstreets-nl tiles for other zoom levels you can use the environement variables "MIN_ZOOM" and "MAX_ZOOM". For example, for zoom level 3 to 4:

```
docker run -i -t --rm --name docker-openstreets-nl -v 'pwd'/:/data -e MIN_ZOOM=3 -e MAX_ZOOM=14 ingmapping/docker-openstreets-nl
```

How to remove your exported tiles if permission problems: 

If the tiles are created by root inside the Docker container it can cause problems when you want to remove your tiles locally on the host with a non-root user. A solution how to remove the files is to run another docker container:

```
docker run -it --rm -v 'pwd'/:/mnt:z phusion/baseimage bash 
cd mnt 
rm -rf tiles 
exit
```

## How to use/view your generated openstreets-nl tiles

Once that you have your tiles exported in a folder directory structure, you can use/view the generated raster tiles using various JavaScript mapping libraries. For example:

* [Leaflet JS](https://leafletjs.com/) is a lightweight open source JavaScript library for building interactive web maps.

```js
	L.tileLayer('file:////PATH-TO-YOUR-TILES-DIRECTORY-HERE/{z}/{x}/{y}.png', {
		minZoom: 5, maxZoom: 16,
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors | <a href="https://github.com/ingmapping/openstreets-nl-tilemill/"> openstreets-nl</a> project - <a href="https://www.ingmapping.com">ingmapping.com</a>'
	}).addTo(map);
```
[Leaflet JS - demo](https://tileserver.ingmapping.com/openstreets_nl/demo.html).
