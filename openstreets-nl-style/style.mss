/**********************************************************

Open Streets, DC
================

*An example of street-level map design.*

Data used by this map is � OpenStreetMap contributors and
distributed under the terms of the Open Database License.
See <http://www.openstreetmap.org/copyright> for details.

Pattern images derived from designs by Subtle Patterns and 
licensed CC-BY-SA. See <http://subtlepatterns.com> for details.

The shapefiles used in this project are based on those
provided by Mike Migurski at <http://metro.teczno.com>.
You can swap out the DC data for any other city there by
downloading the Imposm shapefile package.

***********************************************************/

/* ---- PALETTE ---- */

@water:#bfd8ff;
@park:#cea;
@land:#fafaf8;
@school:#f8e8c8;

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

#ne10admin0countries {
  line-color:#000;
  line-width:0.5;
  line-opacity:0.5;
  polygon-opacity:1;
  polygon-fill:#fafaf8;
}

#nederland {
  line-color:#000;
  line-width:0.5;
  line-opacity:0.5;
  polygon-opacity:1;
  polygon-fill:#f0f0f0;
}

#ne10ocean {
  polygon-fill:@water;
  polygon-gamma:0.5; // reduces gaps between shapes
  polygon-pattern-file:url(images/water.png);
  polygon-pattern-comp-op:color-burn;
  polygon-pattern-alignment:global; // keeps it seamless
}

#bagwoonplaatsgrenzen[zoom>6] {
  line-color:#594;
  line-width:0.5;
  line-opacity:0.1;
  polygon-opacity:1;
  polygon-fill:#fafaf8;
}

#railtracks[zoom>10] {
  line-color:#a8a19e;
  line-dasharray: 1.5;
    [zoom=11] { line-width: 0.3; }
    [zoom=12] { line-width: 0.4; }
    [zoom=13] { line-width: 1; }
    [zoom=14] { line-width: 1.5; }
    [zoom=15] { line-width: 2; }
    [zoom=16] { line-width: 3; }
  }

#airports[zoom>10] {
  line-color:#c9c6bf;
  line-width:0.5;
  polygon-opacity:0.5;
  polygon-fill:#ccc;
  [zoom=11] { polygon-opacity:0.1; }
}

#bagpanden[zoom>15] {
  line-color:#444;
  line-width:0.2;
  polygon-opacity:0.8;
  polygon-fill:#ccc;
}

