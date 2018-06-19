/**********************************************************

OpenStreetsNL 
================

*An example of Carto CSS design with OpenStreetMap data.*

Data used by this map is � OpenStreetMap contributors and
distributed under the terms of the Open Database License.
See <http://www.openstreetmap.org/copyright> for details.

Pattern images derived from designs by Subtle Patterns and 
licensed CC-BY-SA. See <http://subtlepatterns.com> for details.

See https://github.com/ingmapping/openstreets-nl-tilemill
***********************************************************/

/* ---- PALETTE ---- */

Map {
  background-color:#f0f0f0;
}

@water:#bfd8ff;
@park:#cea;
@land:#f0f0f0;
@school:#f8e8c8;


#airports[zoom>10] {
  line-color:#c9c6bf;
  line-width:0.5;
  polygon-opacity:0.5;
  polygon-fill:#ccc;
  [zoom=11] { polygon-opacity:0.1; }
}

#osmrailways[zoom>10] {
  line-color:#a8a19e;
  line-dasharray: 1, 1.5;
    [zoom=11] { line-width: 0.3; }
    [zoom=12] { line-width: 0.4; }
    [zoom=13] { line-width: 1; }
    [zoom=14] { line-width: 1.5; }
    [zoom=15] { line-width: 2; }
    [zoom=16] { line-width: 3; }
}

#osmlanduse[zoom>6] {
  [fclass='forest'],
  [fclass='wood'] {
    polygon-fill:@park;
    polygon-pattern-file:url(images/wood.png);
    polygon-pattern-comp-op:multiply;
  }
  [fclass='cemetery'],
  [fclass='common'],
  [fclass='golf_course'],
  [fclass='park'],
  [fclass='pitch'],
  [fclass='recreation_ground'],
  [fclass='village_green'] {
    polygon-fill:@park;
  }
}

#osmlanduse[zoom>=12] {
  [fclass='school'],
  [fclass='college'],
  [fclass='university'] {
    polygon-fill: @school;
  }
}

#osmwater[zoom>6] {
  polygon-fill:@water;
  polygon-gamma:0.5; // reduces gaps between shapes
  polygon-pattern-file:url(images/water.png);
  polygon-pattern-comp-op:color-burn;
  polygon-pattern-alignment:global; // keeps it seamless
}

#osmnl[zoom>=7] {
  polygon-opacity:1;
  polygon-fill:#fafaf8;
}

#osmnlboundary [zoom>=7] {
  line-color: #ccc;
  line-opacity: 0.7;
  line-width: 1;
  line-dasharray: 10, 3, 2, 3;
}

#nederland[zoom>=1][zoom<7] {
  line-color:#000;
  line-width:1;
  line-opacity:0.5;
  polygon-opacity:1;
  polygon-fill:#fafaf8;
  [zoom<3] {line-opacity:0.2; polygon-fill:#d9d9d9; }
  [zoom<=1] {polygon-fill:#bdbdbd; }
}

#ne10mocean {
  polygon-fill:@water;
  polygon-gamma:0.5; // reduces gaps between shapes
  polygon-pattern-file:url(images/water.png);
  polygon-pattern-comp-op:color-burn;
  polygon-pattern-alignment:global; // keeps it seamless
}

#world {
  [zoom >= 0][zoom < 10] {
    polygon-fill: @land;
    polygon-simplify: 0.4;
    [zoom < 8] {
      line-color: darken(@water,20%);
      line-simplify: 0.4;
      line-width: 0.5;
      line-offset: 0.5;
   	}
    [zoom >= 7] {
    polygon-fill: #f0f0f0;
    }
  }
}

